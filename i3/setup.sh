#!/bin/bash

DOTFILES_DIR=$(dirname $(realpath -s $0))
CONFIG_DIR=$HOME/.config
I3_CONFIG_DIR=$CONFIG_DIR/i3
I3_BLOCKS_CONFIG_DIR=$CONFIG_DIR/i3blocks

sudo pacman -S xorg-server xorg-apps xorg-xinit
sudo pacman -S i3-gaps i3blocks i3lock rofi dunst

mkdir -p $I3_CONFIG_DIR
ln -sf $DOTFILES_DIR/config $I3_CONFIG_DIR/config

git clone https://github.com/vivien/i3blocks-contrib $I3_BLOCKS_CONFIG_DIR
ln -sf $DOTFILES_DIR/i3blocks.config $I3_BLOCKS_CONFIG_DIR/config

yay -Si rofi-dmenu paper-icon-theme nerd-fonts-dejavu-complete
