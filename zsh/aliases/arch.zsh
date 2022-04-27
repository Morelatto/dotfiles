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

# systemctl
alias systemctl='sudo systemctl'
alias sctl='systemctl'
alias sctle='systemctl enable'
alias sctld='systemctl disable'
alias sctls='systemctl start'
alias sctlst='systemctl stop'
alias sctlss='systemctl status'
alias services='systemctl --type=service'
alias mongod='systemctl start mongodb.service'
alias bye='=systemctl poweroff'
alias reboot='=systemctl reboot'

function package_files() { 
	=pacman -Qlq $@ | grep -v '/$' | xargs -r du -h | sort -h
}
