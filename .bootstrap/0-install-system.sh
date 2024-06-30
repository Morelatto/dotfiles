#!/usr/bin/env bash

# Initial setup
loadkeys br-abnt2
ping archlinux.org -c3
wifi-menu if0

# Partitions

# Encryption
cryptsetup luksFormat /dev/sda4 --type luks2 --verify-passphrase --verbose --iter-time 5000
cryptsetup luksOpen /dev/sda4 cryptlvm

# LVM
pvcreate /dev/mapper/cryptlvm
vgcreate cryptvg /dev/mapper/cryptlvm
lvcreate -l +100%FREE cryptvg -n root

# File System
mkfs.ext4 /dev/cryptvg/root
mount /dev/cryptvg/root /mnt

mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
mkdir /mnt/efi/EFI/arch
mkdir /mnt/boot
mount --bind /mnt/efi/EFI/arch /mnt/boot

# Mirrorlists
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose -c Brazil -a 5 --sort rate --save /etc/pacmand.d/mirrorlist

# pacstrap
pacstrap /mnt base base-devel linux linux-firmware vim sudo man-db man-pages openssl cryptsetup lvm2 efitools os-prober grub efibootmgr zsh git dhcpcd

# fstab
genfstab -U /mnt >> /mnt/etc/fstab
# Make /tmp a ramdisk (add the following line to /mnt/etc/fstab)
# tmpfs	/tmp	tmpfs	defaults,noatime,mode=1777	0	0
# Change relatime on all non-boot partitions to noatime (reduces wear if using an SSD)
cat /mnt/etc/fstab

# Localization
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
# Uncomment "en_US.UTF-8 UTF-8" in /etc/locale.gen
vim /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8
LANGUAGE=en_US
LC_ALL=C' >> /etc/locale.conf
echo 'KEYMAP=br-abnt2' > /etc/vconsole.conf

# Network
echo "hostname" > /etc/hostname
#127.0.0.1	localhost
#::1			localhost
#127.0.1.1	hostname.localdomain	hostname
vim /etc/hosts
systemctl enable dhcpcd@<interface>.service

# Initramfs [encryption]
vim /etc/mkinitcpio.conf
# Add 'ext4' to MODULES
# Add 'encrypt' to HOOKS after keyboard
# Add 'lvm2' to HOOKS before filesystems
mkinitcpio -P

# Users
useradd -m -G wheel -s /bin/zsh username
passwd username
# Uncomment %wheel ALL=(ALL) ALL
EDITOR=vim visudo

# Boot Loader
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
# Add GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda4:cryptvg:allow-discards" to /etc/default/grub
grub-mkconfig –o /boot/grub/grub.cfg

# Swap
fallocate -l 8G /swp
chmod 600 /swp
mkswap /swp
echo '/swp none swap sw 0 0' | tee -a /etc/fstab

# Regenerate initramfs
mkinitcpio -p linux

# Utils
pacman -S intel-ucode xorg-server nvidia nvidia-utils wpa_supplicant dialog

# Root password
passwd

umount -R /mnt

## Post

# Enable time sync
systemctl enable systemd-timesyncd
systemctl start systemd-timesyncd
# Fix clock with Windows dual boot
timedatectl set-local-rtc 1 --adjust-system-clock

# Full system upgrade
pacman -Syuu

# Network
ip link
cd /etc/netctl
cp examples/ethernet-dhcp ./custom-dhcp-profile
vim ./custom-dhcp-profile
# Interface=
# DHCPClient=dhcpcd
netctl enable custom-dhcp-profile
systemctl enable dhcpcd.service

# enable fstrim.service systemd unit
systemctl enable fstrim.service
