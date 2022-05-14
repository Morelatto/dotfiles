# pacman
alias pacman='sudo pacman'
alias pc='pacman'
alias pci='pacman -S'
alias pcq='=pacman -Q'
alias pcqs='=pacman -Qs'
alias pcqu='=pacman -Qu'
alias pcr='pacman -R'
alias pcrs='pacman -Rs'
alias pcf='package_files'
alias upt='pacman -Syu'
alias upd='pacman -Sy'
alias upg='pacman -Su'

# aur
alias yi='yay -S'
alias yu='yay -Sua'
alias yy='yay -S --needed --nodiffmenu --nocleanmenu'

# systemd
alias systemctl='sudo systemctl'
alias sctl='systemctl'
alias sctld='systemctl disable'
alias sctle='systemctl enable'
alias sctlr='systemctl restart'
alias sctls='=systemctl status'
alias sctlsp='systemctl stop'
alias sctlst='systemctl start'
alias services='=systemctl --type=service'
alias mongod='systemctl start mongodb.service'
alias bye='=systemctl poweroff'
alias reboot='=systemctl reboot'

function package_files() {
	=pacman -Qlq $@ | grep -v '/$' | xargs -r du -h | sort -h
}
