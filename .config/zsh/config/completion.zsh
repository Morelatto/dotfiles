#!/usr/bin/env zsh
# Minimal Zsh Completion Configuration

# Enable completion caching
zstyle ':completion::complete:*' use-cache yes
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR}/zcompcache"

# Completion matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group completions by type
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# Enable menu selection
zstyle ':completion:*' menu select=2

# Colors for completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Directory stack completion
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# Kill command completion
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd --no-headers'

# Don't complete users
zstyle ':completion:*' users off

# Case-insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Complete . and .. directories
zstyle ':completion:*' special-dirs true

# Ignore completion for non-existent commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Better SSH/SCP/RSYNC completion
h=()
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(< ~/.ssh/known_hosts)"}%%\ *}%%,*})
fi
if [[ -r ~/.ssh/config ]]; then
  h=($h $(grep '^Host ' ~/.ssh/config | awk '{print $2}' | grep -v '\*'))
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:(ssh|scp|rsync):*' hosts $h
fi