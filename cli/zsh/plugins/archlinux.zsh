#!/usr/bin/env zsh
# Arch Linux Configuration - Pacman and AUR helpers

# Skip if not on Arch Linux (check for pacman)
command -v pacman >/dev/null 2>&1 || return 0

# Pacman aliases
alias pacman='sudo pacman'
alias pc='pacman'
alias pci='pacman -S'
alias pcis='pacman -S --needed'
alias pcq='pacman -Q'
alias pcqi='pacman -Qi'
alias pcql='pacman -Ql'
alias pcqs='pacman -Qs'
alias pcqu='pacman -Qu'
alias pcr='pacman -R'
alias pcrs='pacman -Rs'
alias pcrd='pacman -Rdd'
alias pcc='pacman -Scc'
alias pcf='pacman -Ql'
alias pcfo='pacman -Qo'
alias pcs='pacman -Ss'
alias pcsi='pacman -Si'

# System update aliases
alias upd='pacman -Sy'
alias upg='pacman -Su'
alias upt='pacman -Syu'

# AUR helpers (detect which one is installed)
if command -v yay >/dev/null 2>&1; then
    # Single letter shortcut for yay
    alias y='yay'
    
    alias aur='yay'
    alias auri='yay -S'
    alias aurs='yay -Ss'
    alias auru='yay -Sua'
    alias aurua='yay -Syu'
    
    # Additional yay shortcuts
    alias yi='yay -S --noconfirm'
    alias yu='yay -Sua --noconfirm'
    alias yy='yay -S --needed --nodiffmenu --nocleanmenu'
elif command -v paru >/dev/null 2>&1; then
    alias aur='paru'
    alias auri='paru -S'
    alias aurs='paru -Ss'
    alias auru='paru -Sua'
    alias aurua='paru -Syu'
fi

# Combined update alias (Arch-specific)
alias upall='upd && upg && yu'

# Package cleanup
alias orphans='pacman -Qtdq'
alias rmorphans='pacman -Qtdq | sudo pacman -Rns -'
alias pacclean='sudo pacman -Scc && yay -Scc'

# Mirror management
alias mirrors='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorlist='sudo nvim /etc/pacman.d/mirrorlist'

# Package file operations
function pkgfiles() {
    pacman -Qlq "$@" | grep -v '/$' | xargs -r du -h | sort -h
}

function pkgsize() {
    pacman -Qi "$@" | awk '/^Installed Size/ {print $4 $5}'
}

# Search package by file
function pkgby() {
    pacman -Qo "$@"
}

# List explicitly installed packages
alias pkglist='pacman -Qe'
alias pkglist-aur='pacman -Qm'
alias pkglist-native='pacman -Qn'