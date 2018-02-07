alias aedit=" $EDITOR $ZDOTDIR/aliases.zsh; source $ZDOTDIR/aliases.zsh"
 
# Standard aliases

# #
alias _="sudo"
alias c="clear"
alias d=" dirs -v"
alias g="git"
alias l="ls"
alias m="man"
alias p=" ps aux | grep"
alias q="exit"
alias s="sudo"
alias v="vim"

# sudo
alias fdisk="sudo fdisk"
alias mount="sudo mount"
alias openvpn="sudo openvpn"
alias pacman="sudo pacman"
alias systemctl="sudo systemctl"

# vim
alias vi="vim"
alias nano="vim"
alias emacs="vim"
alias sv="sudo vim"

# ls
alias ls=" ls --color=always --classify --human-readable -l"
alias la="ls --almost-all"
alias lr="ls --recursive"
alias lra="lr --almost-all"
alias lad='ls -d -- .*(/)'				# only show dot-directories
alias lsa='ls -a -- .*(.)'				# only show dot-files
alias lsd='ls -d -- *(/)'				# only show directories
alias lse='ls -d -- *(/^F)'				# only show empty directories
alias lsen='ls -d *(/om[1])'				# newest directory
alias lsx='ls -l -- *(*) | head $@ 2&>/dev/null'        # only show executables
alias lsnew='=ls -rtlh -- *(.) | tail $@ 2&>/dev/null'  # only the newest files
alias lsold="=ls -rtl -- *(.) | head $@ 2&>/dev/null"   # display the oldest files
alias lssmall="=ls -Sl -- *(.) | tail $@ 2&>/dev/null"  # display the smallest files
alias lsbig="=ls -lSh -- *(.) | grep -v total | head $@ 2&>/dev/null"    # display the biggest files

# du
alias dua='du -s *(/DN) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'	# show sorted directory sizes for all directories
alias duv='du -s ^.*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'	# show sorted directory sizes for visible directories only
alias duh='du -s .*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'	# show sorted directory sizes for hidden directories only

# cd
alias cd=" cd"
alias up="cd ../"
alias ..="up; ls"
alias ...="up; .."
alias ....="up; ..."

# grep
alias grep="grep --color=auto --binary-files=without-match --ignore-case"
alias egrep="grep -E"
alias fgrep="grep -F"

# git
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gg="git graph"
alias gl="git log"
alias gm="git merge"
alias gp="git push"
alias gr="git rebase"
alias gs="git status"
alias gu="git unstage"

# linux
alias clear=" clear"
alias cp"cp -r"
alias ka="killall"
alias k9="kill -9"
alias mkdir="mkdir -p"
alias path='echo $PATH | tr -s ":" "\n"'
alias rmrf="rm -rf"
alias upg="pacman -Su"
alias upd="pacman -Syy"

# nocorrect
alias cp="nocorrect cp"
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias rm="nocorrect rm"

# vpn
alias pia="systemctl start pia@$VPN_COUNTRY"
alias piad="systemctl stop pia@$VPN_COUNTRY"
 
alias piabr="export VPN_COUNTRY=Brazil; pia"
alias piausc="export VPN_COUNTRY=US-California; pia"
alias piaust="export VPN_COUNTRY=US-Texas; pia"
alias piausf="export VPN_COUNTRY=US-Florida; pia"
alias piaca="export VPN_COUNTRY=CA-Toronto; pia"
alias piamx="export VPN_COUNTRY=Mexico; pia"
alias piasw="export VPN_COUNTRY=Sweden; pia"
 
# other
alias dog="pygmentize -g"
alias ff="firefox-developer-edition"
alias rleague="steam steam://rungameid/252950"
alias windows="sudo mount /dev/sda4 /mnt/Windows"
alias zsh_debug="zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)"
alias i3edit=" $EDITOR $XDG_CONFIG_HOME/i3/config; i3-msg reload"

# Global aliases
 
alias -g G="| grep "
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
 
# Suffix aliases
alias -s {ogg,flac,mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov}="vlc"
alias -s {jpg,JPG,jpeg,JPEG,png,PNG}="feh"
alias -s {gif,GIF} ="$BROWSER"
alias -s {htm,html,php,com,net,org,gov}="$BROWSER"
alias -s pdf="$BROWSER"
alias -s jar="java -jar"
