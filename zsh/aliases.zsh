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
alias gl="git log"

# linux
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
alias path='echo $PATH | tr -s ":" "\n"'

# nocorrect
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias rm="nocorrect rm"

# sudo
alias pacman="sudo pacman"
alias systemctl="sudo systemctl"
alias openvpn="sudo openvpn"
alias fdisk="sudo fdisk"
alias mount="sudo mount"

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
alias ff="firefox-developer-edition"
alias upd="yaourt -Syua --noconfirm"
alias zsh_debug="zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)"
alias rleague="steam steam://rungameid/252950"
alias dog="pygmentize -g"

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
