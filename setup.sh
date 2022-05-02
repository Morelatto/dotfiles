#!/bin/sh

DOTFILES_DIR=$(dirname $(realpath -s $0))
CONFIG_DIR=$HOME/.config
RANGER_CONFIG_DIR=$CONFIG_DIR/ranger

sudo mkdir -p /etc/X11/xorg.conf.d/
mkdir -p $HOME/Pictures/Wallpapers/
mkdir -p ${I3_CONFIG_DIR}
mkdir -p ${RANGER_CONFIG_DIR}
mkdir -p $HOME/.cache/ranger
sudo pacman -S --needed xorg xorg-xinit feh
sudo pacman -S --needed ranger
sudo pacman -S --needed ripgrep bat httpie fd
yay -S --needed --nodiffmenu --nocleanmenu i3blocks-gaps-git corrupter-git
yay -S --needed --nodiffmenu --nocleanmenu adobe-source-code-pro-fonts speedtest-cli-git cht.sh

sudo ln -sf ${DOTFILES_DIR}/misc/pacman.conf /etc/pacman.conf
ln -s ${DOTFILES_DIR}/X11/xinitrc $HOME/.xinitrc
ln -s ${DOTFILES_DIR}/X11/fehbg $HOME/.fehbg
sudo ln -s ${DOTFILES_DIR}/X11/10-monitor.conf /etc/X11/xorg.conf.d/
ln -s ${DOTFILES_DIR}/ranger/rc.conf ${RANGER_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/ranger/scope.sh ${RANGER_CONFIG_DIR}/
git config --global core.excludesfile ${DOTFILES_DIR}/misc/gitignore_global

ZSH_CONFIG_DIR=$CONFIG_DIR/zsh
ZSH_CACHE_DIR=$HOME/.cache
ZSH_ALIAS_DIR=$ZSH_CONFIG_DIR/aliases
ZSH_FUNCTIONS_DIR=$ZSH_CONFIG_DIR/functions
ZSH_COMMON_DIR=$ZSH_CONFIG_DIR/common

pacman -S zsh zsh-autosuggestions zsh-completions
sudo pacman -S xorg-server xorg-apps xorg-xinit
sudo pacman -S i3-gaps i3blocks i3lock rofi dunst
yay -S zsh-syntax-highlighting fzf-tab-bin-git hstr
yay -S autojump cht.sh-git

I3_CONFIG_DIR=$CONFIG_DIR/i3
I3_BLOCKS_CONFIG_DIR=$CONFIG_DIR/i3blocks
mkdir -p $I3_CONFIG_DIR
ln -sf $DOTFILES_DIR/config $I3_CONFIG_DIR/config
git clone https://github.com/vivien/i3blocks-contrib $I3_BLOCKS_CONFIG_DIR
ln -sf $DOTFILES_DIR/i3blocks.config $I3_BLOCKS_CONFIG_DIR/config
yay -Si rofi-dmenu paper-icon-theme nerd-fonts-dejavu-complete

# install maim, xclip, xdotool
# https://github.com/jvz/psgrep
# https://github.com/dastorm/volume-notification-dunst
# https://github.com/ruanyf/simple-bash-scripts/blob/master/scripts/pomodoro.sh
# diff-so-fancy
# nsxiv

pacman -S firefox firefox-ublock-origin
