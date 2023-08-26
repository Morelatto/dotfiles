#!/bin/sh

DOTDIR=$(dirname $(realpath -s $0))
CONFIG_DIR=$HOME/.config

# X setup
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo pacman -S --needed xorg xorg-xinit
sudo pacman -S xorg-server xorg-apps xorg-xinit
ln -s ${DOTDIR}/X11/xinitrc $HOME/.xinitrc
sudo ln -s ${DOTDIR}/X11/10-monitor.conf /etc/X11/xorg.conf.d/

# Wallpaper setup
sudo pacman -S --needed feh
mkdir -p $HOME/Pictures/Wallpapers/
ln -s ${DOTDIR}/X11/fehbg $HOME/.fehbg

# Ranger setup
RANGER_CONFIG_DIR=$CONFIG_DIR/ranger
mkdir -p ${RANGER_CONFIG_DIR}
mkdir -p $HOME/.cache/ranger
pacman -S ranger python-pygments
pip uninstall -y pillow
pip install ueberzug pillow-simd
cp /usr/share/doc/ranger/config/scope.sh $RANGER_CONFIG_DIR/scope.sh
ln -sf $DOTDIR/rc.conf $RANGER_CONFIG_DIR/rc.conf
ln -s ${DOTDIR}/ranger/scope.sh ${RANGER_CONFIG_DIR}/

pacman -S firefox firefox-ublock-origin
# Pacman
sudo ln -sf ${DOTDIR}/misc/pacman.conf /etc/pacman.conf

# Git
git config --global core.excludesfile ${DOTDIR}/misc/gitignore_global

# External tools
sudo pacman -S --needed ripgrep bat httpie fd
yay -S --needed --nodiffmenu --nocleanmenu corrupter-git
yay -S --needed --nodiffmenu --nocleanmenu adobe-source-code-pro-fonts speedtest-cli-git cht.sh
# install maim, xclip, xdotool
# https://github.com/jvz/psgrep
# https://github.com/dastorm/volume-notification-dunst
# https://github.com/ruanyf/simple-bash-scripts/blob/master/scripts/pomodoro.sh
# diff-so-fancy
# nsxiv
# vivid
# docker completion
# https://github.com/alanzchen/rm-protection
# https://gitlab.com/wavexx/networkd-notify
# Install Hack NerdFont