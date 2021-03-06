#!/usr/bin/env bash
DOTFILES_DIR=$(dirname $(realpath -s $0))

sudo ln -sf ${DOTFILES_DIR}/misc/pacman.conf /etc/pacman.conf

# TODO install yay

# X11
sudo pacman -S --needed xorg xorg-xinit feh

mkdir -p $HOME/Pictures/Wallpapers/
sudo mkdir -p /etc/X11/xorg.conf.d/

ln -s ${DOTFILES_DIR}/X11/xinitrc $HOME/.xinitrc
ln -s ${DOTFILES_DIR}/X11/fehbg $HOME/.fehbg
sudo chattr +i $HOME/.fehbg
sudo ln -s ${DOTFILES_DIR}/X11/10-monitor.conf /etc/X11/xorg.conf.d/

# i3
sudo pacman -S --needed i3-gaps i3lock rofi bc lm_sensors scrot sysstat alsa-utils playerctl openvpn
yay -S --needed --nodiffmenu --nocleanmenu i3blocks-gaps-git corrupter-git

I3_CONFIG_DIR=$HOME/.config/i3
I3_BLOCKS_DIR=/usr/lib/i3blocks
mkdir -p ${I3_CONFIG_DIR}

ln -s ${DOTFILES_DIR}/i3/config ${I3_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/i3/i3blocks.conf ${I3_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/i3/lock.sh ${I3_CONFIG_DIR}/
# TODO for each folder in i3blocks-contrib ln -sf
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/bandwidth/bandwidth ${I3_BLOCKS_DIR}/bandwidth
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/cpu_usage/cpu_usage ${I3_BLOCKS_DIR}/cpu_usage
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/disk/disk ${I3_BLOCKS_DIR}/disk
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/disk-io/disk-io ${I3_BLOCKS_DIR}/disk-io
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/iface/iface ${I3_BLOCKS_DIR}/iface
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/load_average/load_average ${I3_BLOCKS_DIR}/load_average
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/mediaplayer/mediaplayer ${I3_BLOCKS_DIR}/mediaplayer
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/memory/memory ${I3_BLOCKS_DIR}/memory
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/openvpn/openvpn ${I3_BLOCKS_DIR}/openvpn
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/temperature/temperature ${I3_BLOCKS_DIR}/temperature
sudo ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/volume/volume ${I3_BLOCKS_DIR}/volume

# urxvt
yay -S --needed --nodiffmenu --nocleanmenu rxvt-unicode-pixbuf
sudo pacman -S --needed urxvt-perls 

URXVT_CONFIG_DIR=$HOME/.config/urxvt
mkdir -p ${URXVT_CONFIG_DIR}

ln -s ${DOTFILES_DIR}/urxvt/Xresources $HOME/.Xresources
ln -s ${DOTFILES_DIR}/urxvt/base16-classic-dark-256.Xresources ${URXVT_CONFIG_DIR}/

# ranger
sudo pacman -S --needed ranger

RANGER_CONFIG_DIR=$HOME/.config/ranger
mkdir -p ${RANGER_CONFIG_DIR}
mkdir -p $HOME/.cache/ranger

ln -s ${DOTFILES_DIR}/ranger/rc.conf ${RANGER_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/ranger/scope.sh ${RANGER_CONFIG_DIR}/

# misc
sudo pacman -S --needed ripgrep bat httpie fd
yay -S --needed --nodiffmenu --nocleanmenu adobe-source-code-pro-fonts speedtest-cli-git cht.sh
git config --global core.excludesfile ${DOTFILES_DIR}/misc/gitignore_global

