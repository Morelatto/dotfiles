#!/usr/bin/env zsh
# ZSH Environment - loaded before .zshrc

# Essential environment variables
export EDITOR="${EDITOR:-nvim}"
export VISUAL="$EDITOR"
export PAGER="${PAGER:-less}"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Set ZDOTDIR
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Clean PATH - use ZSH native typeset
typeset -U path PATH
path=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.cargo/bin"
    "/usr/local/bin"
    $path
)

# Language settings
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# History configuration
export HISTFILE="${ZDOTDIR}/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

# Less configuration
export LESS="-R -F -X"
export LESSHISTFILE=-

# Bun configuration
export BUN_INSTALL="$HOME/.bun"
path=($BUN_INSTALL/bin(N) $BUN_INSTALL/install/global/node_modules/.bin(N) $path)

# Docker configuration
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Kubectl configuration
export KUBECTL_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/kubectl"
