alias aedit=" $EDITOR $ZDOTDIR/aliases.zsh; source $ZDOTDIR/aliases.zsh"
 
# Standard aliases

# vim
alias v="vim"
alias vi="vim"
alias nano="vim"
alias emacs="vim"

# ls
alias ls=" ls --color=always --classify --human-readable -l"
alias l="ls"
alias la="ls --almost-all"
alias lr="ls --recursive"
alias lra="lr --almost-all"
 
# cd
alias cd=" cd"
alias up="cd ../"
alias ..="up; ls"
alias ...="up; .."
alias ....="up; ..."

# grep
alias grep="grep --color=auto --binary-files=without-match --ignore-case"
alias fgrep="grep -F"
alias egrep="grep -E"

# git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git graph"
alias gco="git checkout"

# other
alias p=" ps aux | grep"
alias d=" dirs -v"
alias clear=" clear"
alias c="clear"
alias q="exit"
alias ka="killall"
alias k9="kill -9"
alias rmrf="rm -rf"
alias cp"cp -r"
alias mkdir="mkdir -p"
alias pacman="sudo pacman"
alias systemctl="sudo systemctl"

# vpn
alias pia_vpn_con="systemctl start pia@\$VPN_COUNTRY"
alias pia_vpn_discon="systemctl stop pia@\$VPN_COUNTRY"
 
alias pia_br="export VPN_COUNTRY=\"Brazil\"; pia_vpn_con"
alias pia_us_cali="export VPN_COUNTRY=\"US-California\"; pia_vpn_con"
alias pia_us_tex="export VPN_COUNTRY=\"US-Texas\"; pia_vpn_con"
alias pia_us_flo="export VPN_COUNTRY=\"US-Florida\"; pia_vpn_con"
alias pia_ca="export VPN_COUNTRY=\"CA-Toronto\"; pia_vpn_con"
alias pia_mx="export VPN_COUNTRY=\"Mexico\"; pia_vpn_con"
alias pia_sw="export VPN_COUNTRY=\"Sweden\"; pia_vpn_con"
 
# other
alias ffox="firefox-developer-edition"
alias upd="yaourt -Syua --noconfirm"
alias zsh_debug="zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)"
alias rleague="steam steam://rungameid/252950"
 
# Global aliases
 
alias -g G="| grep "
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
 
# Suffix aliases
 
alias -s htm="$BROWSER$"
alias -s html="$BROWSER$"
alias -s pdf="$BROWSER$"
alias -s gif="$BROWSER$"
alias -s webm="$BROWSER$"
alias -s jar="java -jar"
