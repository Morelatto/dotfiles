#!/usr/bin/env zsh
# Minimal Zsh Keybindings Configuration

# Use emacs keybindings
bindkey -e

# History search with arrow keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Create key array using terminfo
typeset -g -A key
key=(
    Home     "${terminfo[khome]}"
    End      "${terminfo[kend]}"
    Insert   "${terminfo[kich1]}"
    Delete   "${terminfo[kdch1]}"
    Up       "${terminfo[kcuu1]}"
    Down     "${terminfo[kcud1]}"
    Left     "${terminfo[kcub1]}"
    Right    "${terminfo[kcuf1]}"
    PageUp   "${terminfo[kpp]}"
    PageDown "${terminfo[knp]}"
    BackTab  "${terminfo[kcbt]}"
)

# Bind keys
[[ -n "${key[Home]}"     ]] && bindkey -- "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]] && bindkey -- "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]] && bindkey -- "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]] && bindkey -- "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]] && bindkey -- "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"     ]] && bindkey -- "${key[Down]}"     down-line-or-beginning-search
[[ -n "${key[Left]}"     ]] && bindkey -- "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]] && bindkey -- "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]] && bindkey -- "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[BackTab]}"  ]] && bindkey -- "${key[BackTab]}"  reverse-menu-complete

# Common keybindings
bindkey '^[[1;5C' forward-word      # Ctrl+Right
bindkey '^[[1;5D' backward-word     # Ctrl+Left
bindkey '^H'      backward-kill-word # Ctrl+Backspace
bindkey '^[[3;5~' kill-word         # Ctrl+Delete

# Edit command in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Make sure the terminal is in application mode when zle is active
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi