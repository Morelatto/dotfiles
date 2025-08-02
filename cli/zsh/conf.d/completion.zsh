#!/usr/bin/env zsh
# Zsh Completion System Configuration

# Initialize completion system with optimizations
autoload -Uz compinit

# Smart recompiling: only recompile if dump is older than 24 hours
local zcompdump="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompdump-${ZSH_VERSION}"
if [[ -f "$zcompdump" && "$zcompdump" -nt /usr/share/zsh ]] && 
   [[ ! "$zcompdump.zwc" -ot "$zcompdump" ]]; then
    # Dump exists and is recent, just source it
    compinit -C -d "$zcompdump"
else
    # Rebuild dump
    compinit -d "$zcompdump"
    # Compile the dump file for faster loading (background)
    { zcompile "$zcompdump" } &!
fi

# Essential: Fuzzy matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Essential: Interactive menu
zstyle ':completion:*' menu select

# Essential: Colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Nice to have: Caching (with fallback)
zstyle ':completion::complete:*' use-cache yes
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"

# Nice to have: SSH hosts
if [[ -r ~/.ssh/config ]]; then
  zstyle ':completion:*:(ssh|scp|rsync):*' hosts $(grep '^Host ' ~/.ssh/config | awk '{print $2}' | grep -v '\*')
fi

# Nice to have: Special dirs
zstyle ':completion:*' special-dirs true