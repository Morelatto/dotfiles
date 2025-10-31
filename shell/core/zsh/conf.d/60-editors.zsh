#!/usr/bin/env zsh
# Text Editors - Neovim, Vim, and editor configuration

# =============================================================================
# Neovim / Vim
# =============================================================================
if (( $+commands[nvim] )); then
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    alias nv='nvim'
    alias vz='nvim ~/.config/zsh/.zshrc'
    alias vg='nvim ~/.config/git/config'
    alias vv='nvim ~/.config/nvim/init.lua'
    alias nvd='nvim --noplugin'
    alias nvr='nvim -R'
elif (( $+commands[vim] )); then
    alias vi='vim'
    alias v='vim'
fi

