#!/usr/bin/env bash

# install vim
# install git

VIM_DOTFILES_DIR=$(dirname $(realpath -s $0))
VIM_RUNTIME_DIR=$HOME/.vim

mkdir -p $VIM_RUNTIME_DIR
mkdir -p $VIM_RUNTIME_DIR/bundle
mkdir -p $VIM_RUNTIME_DIR/undo
mkdir -p $VIM_RUNTIME_DIR/swap
mkdir -p $VIM_RUNTIME_DIR/backup

ln -sf $VIM_DOTFILES_DIR/vimrc $HOME/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git $VIM_RUNTIME_DIR/bundle/Vundle.vim

