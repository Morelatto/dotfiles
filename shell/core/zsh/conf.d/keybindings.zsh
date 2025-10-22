#!/usr/bin/env zsh
# Minimal Zsh Keybindings for XFCE Terminal

# Use emacs keybindings
bindkey -e

# History search with arrows - THE killer feature
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search    # Up arrow
bindkey '^[[B' down-line-or-beginning-search  # Down arrow

# Edit in $EDITOR with Alt+E (avoids terminal conflicts)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

# Word navigation
bindkey '^[[1;5C' forward-word   # Ctrl+Right
bindkey '^[[1;5D' backward-word  # Ctrl+Left

# Home/End keys
bindkey '^[[H' beginning-of-line  # Home
bindkey '^[[F' end-of-line        # End
bindkey '^[[3~' delete-char       # Delete

# Alias expansion with Ctrl+Space
bindkey '^@' _expand_alias        # Ctrl+Space (^@) expands aliases
