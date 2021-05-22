#!/usr/bin/env bash

# install zsh
# install antigen
# install autojump

ZSH_DOTFILES_DIR=$(dirname $(realpath -s $0))
ZSH_CONFIG_DIR=$HOME/.config/zsh
ZSH_CACHE_DIR=$HOME/.cache

mkdir -p $ZSH_CONFIG_DIR/aliases
mkdir -p $ZSH_CONFIG_DIR/functions
mkdir -p $ZSH_CACHE_DIR

ln -sf $ZSH_DOTFILES_DIR/zshenv $HOME/.zshenv
ln -sf $ZSH_DOTFILES_DIR/zshrc $ZSH_CONFIG_DIR/.zshrc
ln -sf $ZSH_DOTFILES_DIR/zplugrc $ZSH_CONFIG_DIR/.zplugrc
ln -sf $ZSH_DOTFILES_DIR/common/options.zsh $ZSH_CONFIG_DIR/
ln -sf $ZSH_DOTFILES_DIR/common/keybindings.zsh $ZSH_CONFIG_DIR/
ln -sf $ZSH_DOTFILES_DIR/common/aliases.zsh $ZSH_CONFIG_DIR/aliases/
ln -sf $ZSH_DOTFILES_DIR/common/functions.zsh $ZSH_CONFIG_DIR/functions/
ln -sf $ZSH_DOTFILES_DIR/aliases/common.zsh $ZSH_CONFIG_DIR/aliases/
ln -sf $ZSH_DOTFILES_DIR/aliases/debian.zsh $ZSH_CONFIG_DIR/aliases/
ln -sf $ZSH_DOTFILES_DIR/functions/cheat-sh.zsh $ZSH_CONFIG_DIR/functions/
ln -sf $ZSH_DOTFILES_DIR/functions/expand-aliases.zsh $ZSH_CONFIG_DIR/functions/
ln -sf $ZSH_DOTFILES_DIR/functions/time-functions.zsh $ZSH_CONFIG_DIR/functions/