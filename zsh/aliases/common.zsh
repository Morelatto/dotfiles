alias aee=" $EDITOR $ZALIASES; source $ZALIASES/aliases.zsh"
alias i3edit=" $EDITOR $XDG_CONFIG_HOME/i3/config; i3-msg reload"
alias ffedit=" $EDITOR $MOZ_PATH; killall firefox; firefox &"
alias rxvtedit=" $EDITOR ~/.Xresources; xrdb -load ~/.Xresources"

# a-z
alias b="bluetoothctl"
alias c="clear"
alias f="find"
alias g="git"
alias l="ll"
alias m="man"
alias p="ps -xe --forest"
alias q="exit"
alias s="sudo"
alias v="vim"

# cd
alias up="cd ../"
alias ..="up; ls"
alias ...="up; .."
alias ....="up; ..."

# du
alias dua='du -s *(/DN) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # all directories sorted by size
alias duv='du -s ^.*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'   # visible directories sorted by size
alias duh='du -s .*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # hidden directories sorted by size

# find
alias fd='find . -maxdepth 1 -not -path "*./.*" -type d | sort'
alias ff='find . -maxdepth 1 -not -path "*./.*"  -type f | sort'
alias fdotd='find . -maxdepth 1 -path "*/.*" -type d | sort'
alias fdotf='find . -maxdepth 1 -path "*./.*" -type f | sort'
alias fmac="find . -name '.DS_Store' -type f -delete"

# gradle
alias gr="./gradlew"
alias grc="gr clean"
alias grb="gr build"
alias grbr="gr bootRun"
alias grbrd="gr build --refresh-dependencies"
alias gri="gr install"
alias grcb="grc && grb"
alias grci="grc && gri"

# git
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gca="git commit --amend -m"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gg="git graph"
alias ghard="git reset --hard HEAD"
alias gl="git log"
alias glg="git log --oneline --decorate --all --graph"
alias gm="git merge"
alias gp="git push"
alias gpf="git push --force"
alias gpl="git pull"
alias gr="git rebase"
alias gs="git status"
alias gsb="git submodule"
alias gu="git unstage"

# grep
alias grep="grep --color=always --ignore-case"
alias fgrep="grep --fixed-strings"
alias egrep="grep --extended-regexp"
alias lgrep="grep -rnw '.' -e"

# linux
alias bye="=systemctl poweroff"
alias clear="clear"
alias cp="cp -r"
alias ka="killall"
alias k9="kill -9"
alias mkdir="mkdir -p"
alias path='echo $PATH | tr -s ":" "\n"'
alias rmrf="rm -rf"
alias tf="tail -F"

# ls
alias ls="ls --color=always --classify --human-readable"
alias ll="ls -l"
alias la="ls --almost-all"
alias lla="ll --almost-all"
alias lr="ls --recursive"
alias llr="ll --recursive"
alias lra="lr --almost-all"

alias lse='ls -d -- *(/^F)'                                             # empty directories
alias lsen='ls -d *(/om[1])'                                            # newest directory
alias lsx='ls -l -- *(*) | head $@ 2&>/dev/null'                        # executables
alias lsnew='=ls -rtlh -- *(.) | tail $@ 2&>/dev/null'                  # newest files
alias lsold="=ls -rtl -- *(.) | head $@ 2&>/dev/null"                   # oldest files
alias lsmall="=ls -Sl -- *(.) | tail $@ 2&>/dev/null"                   # smallest files
alias lsbig="=ls -lSh -- *(.) | grep -v total | head $@ 2&>/dev/null"   # biggest files

# maven
alias mvc="mvn clean"
alias mvi="mvn install"
alias mvci="mvc && mvi"

# network
alias resolv="sudo vim /etc/resolv.conf"
alias pingd="ping -c3 duckduckgo.com"

# ps
alias pp="ps | grep "
alias pmem="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"
alias pcpu="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head"

# python
alias requires="pip install -r requirements.txt"
alias sc="scrapy"
alias scc="scrapy crawl"
alias venv="virtualenv venv && source ./venv/bin/activate"

# sudo
alias fdisk="sudo fdisk"
alias mount="sudo mount"
alias umount="sudo umount"
alias openvpn="sudo openvpn"
alias pvpn="sudo protonvpn-cli"
alias systemctl="sudo systemctl"

# tar
alias targz="tar xzf"
alias targzc="tar -czvf"
alias tarc="tar -cvf"
alias tarbz2="tar xjf"
alias tarxz="tar xf"
alias tarls="tar tvf"

# vim
alias vi="vim"
alias nano="vim"
alias emacs="vim"
alias sv="sudo vim"

# vpn
alias pvpnc="pvpn -c"
alias pvpnd="pvpn -d"
alias pvpnr="pvpn --reconnect"
alias pvpnf="pvpn -f"

# other
alias dog="pygmentize -g"
alias fox="firefox -no-remote"
alias vr="veracrypt"
alias zshdebug="zsh -xv &> >(tee ~/zsh-debug.log 2>/dev/null)"

# Global aliases

alias -g G="| grep "
alias -g FG="| fgrep "
alias -g EG="| egrep "
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g X="| xclip -selection clipboard -i"
