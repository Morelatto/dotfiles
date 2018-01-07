export EDITOR="vim"
 
bindkey -e
 
alias vi="vim"
alias aedit=" $EDITOR $ZSH_CONFIG/aliases.zsh; source $ZSH_CONFIG/aliases.zsh"
 
# Standard aliases
 
# ls
alias ls=" ls --color=always --classify --human-readable -l"
alias l=" ls"
alias la=" ls --almost-all"
alias lr=" ls --recursive"
alias lra=" lr --almost-all"
 
# cd
alias cd=" cd"
alias ..=" cd ..; ls"
alias ...=" cd ..; .."
alias ....=" cd ..; ..."
 
# grep
alias grep="grep --color=auto --binary-files=without-match --ignore-case"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
 
# other
alias p=" ps aux | grep"
alias g="git"
alias d=" dirs -v"
alias ka="killall"
alias k9="kill -9"
alias clear=" clear"

# vpn
export VPN_COUNTRY="Brazil"
alias pia_vpn_con="sudo systemctl start pia@\$VPN_COUNTRY"
alias pia_vpn_discon="sudo systemctl stop pia@\$VPN_COUNTRY"
 
alias pia_br="export VPN_COUNTRY=\"Brazil\"; pia_vpn_con"
alias pia_us_cali="export VPN_COUNTRY=\"US-California\"; pia_vpn_con"
alias pia_us_tex="export VPN_COUNTRY=\"US-Texas\"; pia_vpn_con"
alias pia_us_flo="export VPN_COUNTRY=\"US-Florida\"; pia_vpn_con"
alias pia_ca="export VPN_COUNTRY=\"CA-Toronto\"; pia_vpn_con"
alias pia_mx="export VPN_COUNTRY=\"Mexico\"; pia_vpn_con"
alias pia_sw="export VPN_COUNTRY=\"Sweden\"; pia_vpn_con"
 
# other
alias ffox="firefox-developer"
alias upd="yaourt -Syua --noconfirm"
alias zsh_debug="zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)"
alias rocket_league="steam steam://rungameid/252950"
 
# Global aliases
 
alias -g G="| grep "
alias -g L="| less"
 
# Suffix aliases
 
alias -s htm="$BROWSER$"
alias -s html="$BROWSER$"
alias -s pdf="$BROWSER$"
alias -s gif="$BROWSER$"
alias -s webm="$BROWSER$"
alias -s jar="java -jar"
