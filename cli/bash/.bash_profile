#!/usr/bin/env bash
# ~/.bash_profile - Bash login shell configuration

# Source bashrc for interactive shells
[[ -f ~/.bashrc ]] && source ~/.bashrc

# User specific environment
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Disable system beep for X11 sessions
[[ -n "$DISPLAY" ]] && xset -b 2>/dev/null