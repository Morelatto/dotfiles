#!/bin/bash

DOTFILES_DIR=$(dirname $(realpath -s $0))
CONFIG_DIR=$HOME/.config

ZSH_CONFIG_DIR=$CONFIG_DIR/zsh
ZSH_CACHE_DIR=$HOME/.cache
ZSH_ALIAS_DIR=$ZSH_CONFIG_DIR/aliases
ZSH_FUNCTIONS_DIR=$ZSH_CONFIG_DIR/functions
ZSH_COMMON_DIR=$ZSH_CONFIG_DIR/common

pacman -S zsh zsh-autosuggestions zsh-completions

mkdir -p $ZSH_ALIAS_DIR
mkdir -p $ZSH_FUNCTIONS_DIR
mkdir -p $ZSH_COMMON_DIR
mkdir -p $ZSH_CACHE_DIR

ln -sf $DOTFILES_DIR/zshenv $ZSH_CONFIG_DIR/.zshenv
ln -sf $DOTFILES_DIR/zshrc $ZSH_CONFIG_DIR/.zshrc
ln -sf $DOTFILES_DIR/zprofile $ZSH_CONFIG_DIR/.zprofile

ln -sf $DOTFILES_DIR/common/options.zsh $ZSH_COMMON_DIR
ln -sf $DOTFILES_DIR/common/keybindings.zsh $ZSH_COMMON_DIR
ln -sf $DOTFILES_DIR/common/aliases.zsh $ZSH_COMMON_DIR
ln -sf $DOTFILES_DIR/common/completions.zsh $ZSH_COMMON_DIR
ln -sf $DOTFILES_DIR/common/functions.zsh $ZSH_COMMON_DIR

ln -sf $DOTFILES_DIR/aliases/common.zsh $ZSH_ALIAS_DIR
ln -sf $DOTFILES_DIR/aliases/arch.zsh $ZSH_ALIAS_DIR
ln -sf $DOTFILES_DIR/aliases/linux.zsh $ZSH_ALIAS_DIR
ln -sf $DOTFILES_DIR/aliases/global.zsh $ZSH_ALIAS_DIR

ln -sf $DOTFILES_DIR/functions/time-functions.zsh $ZSH_FUNCTIONS_DIR
ln -sf $DOTFILES_DIR/functions/ctrlz.zsh $ZSH_FUNCTIONS_DIR
ln -sf $DOTFILES_DIR/functions/rangercd.zsh $ZSH_FUNCTIONS_DIR
ln -sf $DOTFILES_DIR/functions/hstr.zsh $ZSH_FUNCTIONS_DIR


yay -S zsh-fast-syntax-highlighting fzf-tab-bin-git hstr


# install autojump

# install cheat

# install command not found

# install powerlevel10k fonts
