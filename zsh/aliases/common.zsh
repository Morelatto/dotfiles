alias aedit=" $EDITOR $ZALIASES; source $ZALIASES/aliases.zsh"
alias i3edit=" $EDITOR $XDG_CONFIG_HOME/i3/config; i3-msg reload"
alias ffedit=" $EDITOR $MOZ_PATH; killall firefox; firefox &"
 
# Standard aliases

# a-z
alias _="sudo "
alias b="bluetoothctl"
alias c="clear"
alias d="dirs -v"
alias g="git"
alias l="ls"
alias m="man"
alias p="ps -xe --forest | less -S"
alias q="exit"
alias s="sudo "
alias u="cd ../"
alias v="vim"

# sudo
alias fdisk="sudo fdisk"
alias mount="sudo mount"
alias umount="sudo umount"
alias openvpn="sudo openvpn"
alias systemctl="sudo systemctl"

# vim
alias vi="vim"
alias nano="vim"
alias emacs="vim"
alias sv="sudo vim"

# ls
alias ls="ls --color=always --classify"
alias ll="ls -l --human-readable"
alias la="ls --almost-all"
alias lla="ll --almost-all"
alias lr="ls --recursive"
alias llr="ll --recursive"
alias lra="lr --almost-all"

alias lad='ls -d -- .*(/)'                                              # hidden directories
alias lsa='ls -a -- .*(.)'                                              # hidden files
alias lsd='ls -d -- *(/)'                                               # directories
alias lse='ls -d -- *(/^F)'                                             # empty directories
alias lsen='ls -d *(/om[1])'                                            # newest directory
alias lsx='ls -l -- *(*) | head $@ 2&>/dev/null'                        # executables
alias lsnew='=ls -rtlh -- *(.) | tail $@ 2&>/dev/null'                  # newest files
alias lsold="=ls -rtl -- *(.) | head $@ 2&>/dev/null"                   # oldest files
alias lsmall="=ls -Sl -- *(.) | tail $@ 2&>/dev/null"                   # smallest files
alias lsbig="=ls -lSh -- *(.) | grep -v total | head $@ 2&>/dev/null"   # biggest files

# du
alias dua='du -s *(/DN) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # all directories sorted by size
alias duv='du -s ^.*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'   # visible directories sorted by size
alias duh='du -s .*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # hidden directories sorted by size

# ps
alias pp="ps -xe --forest | less -S --pattern"
alias pmem="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"
alias pcpu="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head"

# cd
alias up="cd ../"
alias ..="up; ls"
alias ...="up; .."
alias ....="up; ..."

# grep
alias grep="grep --color=auto --binary-files=without-match --ignore-case"
alias fgrep="grep -F"
alias egrep="grep -E"
alias lgrep="grep -rnw '.' -e"

# git
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gg="git graph"
alias gl="git log"
alias glg="git log --oneline --decorate --all --graph"
alias gm="git merge"
alias gp="git push"
alias gpl="git pull"
alias gr="git rebase"
alias gs="git status"
alias gsb="git submodule"
alias gu="git unstage"

# tar
alias targz="tar xzf"
alias targzC="tar -czvf"
alias tarbz2="tar xjf"
alias tarxz="tar xf"
alias tarls="tar tvf"

# linux
alias clear="clear"
alias cp="cp -r"
alias ka="killall"
alias k9="kill -9"
alias mkdir="mkdir -p"
alias path='echo $PATH | tr -s ":" "\n"'
alias rmrf="rm -rf"
alias tf="tail -F"
alias bye="=systemctl poweroff"
alias vol="alsamixer"

# gradle
alias gr="./gradlew"
alias grc="gr clean"
alias grb="gr build"
alias grbr="gr bootRun"
alias grbrd="gr build --refresh-dependencies"
alias gri="gr install"
alias grcb="grc && grb"
alias grci="grc && gri"

# other
alias ff="firefox"
alias zsh_debug="zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)"
alias dog="pygmentize -g"
alias vr="veracrypt"
alias venv="virtualenv ENV"

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
