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

# =============================================================================
# Task Runner
# =============================================================================
if (( $+commands[go-task] )); then
    alias t='go-task'
    alias task='go-task'
    alias tl='task --list'
    alias ta='task --list-all'
fi

# =============================================================================
# Developer Reference Tools
# =============================================================================
# Cheat sheet lookup (cheat.sh)
alias cht='cht.sh'

# =============================================================================
# Development Server
# =============================================================================
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

