#!/usr/bin/env zsh
# Arch Linux specific aliases - pacman, yay, systemd

# Pacman aliases
alias pacman='sudo pacman'
alias pc='pacman'
alias pci='pacman -S'
alias pcq='=pacman -Q'
alias pcqs='=pacman -Qs'
alias pcqu='=pacman -Qu'
alias pcr='pacman -R'
alias pcrs='pacman -Rs'
alias pcrd='pacman -Rcd'
alias pcf='package_files'
alias upt='pacman -Syu'
alias upd='pacman -Sy'
alias upg='pacman -Su'
alias upall='upd && upg && yu'

# AUR helpers (yay)
alias yi='yay -S'
alias yu='yay -Sua'
alias yy='yay -S --needed --nodiffmenu --nocleanmenu'

# Systemd aliases
alias systemctl='sudo systemctl'
alias sctl='systemctl'
alias sctld='systemctl disable'
alias sctle='systemctl enable'
alias sctlr='systemctl restart'
alias sctls='=systemctl status'
alias sctlsp='systemctl stop'
alias sctlst='systemctl start'
alias services='=systemctl --type=service'

# Common services
alias mongod='systemctl start mongodb.service'

# Power management
alias bye='=systemctl poweroff'
alias reboot='=systemctl reboot'

# Package information function
function package_files() {
    =pacman -Qlq $@ | grep -v '/$' | xargs -r du -h | sort -h
}