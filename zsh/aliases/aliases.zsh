alias aee="$EDITOR $ZALIASES && source $ZCOMMON/aliases.zsh"
alias iee="$EDITOR $XDG_CONFIG_HOME/i3/config && i3-msg reload"
alias xee="$EDITOR ~/.Xresources && xrl"
alias zee="$EDITOR $ZDOTDIR"

# a-z
alias a='alias'
alias b='bat'
alias c='cat'
alias f='fd'
alias h='histdb'
alias l='ls'
alias m='man'
alias p='ps'
alias q='exit'
alias s='sudo'
alias t='tree'
alias v='vim'
alias y='yay'
alias z='zsh'

# cd
alias .='cd ./'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'

# clipboard
alias copy='xsel -ib'
alias paste='xsel -o'
alias xcopy='xclip -sel clip'

# du
alias dua='du -s *(/DN) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'
alias duv='du -s ^.*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'
alias duh='du -s .*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'

# ext
alias cat='bat --paging=never'
alias cht='cht.sh'
alias fox='firefox'
alias hstr='HSTR_CONFIG=hicolor,raw-history-view hstr --'
alias pom='potato'
alias psg='psgrep'

# fd
alias noeclipse="fd '\.(settings|classpath|factorypath|project)' -tf -X rm"
alias noidea="fd -H '^\.idea$' -td -X rm -r"
alias nomac="fd -H '^\.DS_Store$' -tf -X rm"
alias nopyc="fd -H 'pyc(ache)?' -X rm -r"

# git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gua='git restore --staged'
alias gb='git branch'
alias gbl='git branch --list'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias ghard='git reset --hard HEAD'
alias gl='git log'
alias glg='git log --oneline --decorate --all --graph'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force'
alias gpl='git pull'
alias grm='git rm'
alias gs='git status'
alias gsb='git submodule'
alias gsba='git submodule add'
alias gsoft='git reset'
alias gst='git stash'
alias gut='git stash pop'
alias authors="git ls-files | while read f; do git blame -w -M -C -C --line-porcelain \$f | grep -I '^author '; done | sort -f | uniq -ic | sort -n"

# gradle
alias gr='./gradlew'
alias grc='gr clean'
alias grb='gr build'
alias grbr='gr bootRun'
alias grbrd='gr build --refresh-dependencies'
alias gri='gr install'
alias grcb='grc && grb'
alias grci='grc && gri'

# grep
alias grep='grep --color=auto --ignore-case'
alias fgrep='grep --fixed-strings'
alias egrep='grep --extended-regexp'
alias lgrep="grep -rnw '.' -e"
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

# kill
alias ka='killall'
alias k9='kill -9'

# linux
alias all='alias'
alias chx='chmod +x'
alias cp='cp -r'
alias df='df -h'
alias mkdir='mkdir -p'
alias md='mkdir'
alias off='xset dpms force off'
alias rf='readlink -f'
alias rm='rm-p'
alias rmrf='rm -rf'
alias tf='tail -F'
alias xrl='xrdb -load ~/.Xresources'

# ls
alias ls="ls --color=auto -hlF"
alias la='ls -lA'
alias lr='ls -R'
alias lra='lr -A'
alias l.='ls -d .*'
alias lse='ls -d -- *(/^F)'                                             # empty directories
alias lsen='ls -d *(/om[1])'                                            # newest directory
alias lsx='ls -l -- *(*) | head $@ 2&>/dev/null'                        # asd executables
alias lsnew='=ls -rtlh -- *(.) | tail $@ 2&>/dev/null'                  # newest files
alias lsold='=ls -rtl -- *(.) | head $@ 2&>/dev/null'                   # oldest files
alias lsmall='=ls -Sl -- *(.) | tail $@ 2&>/dev/null'                   # smallest files
alias lsbig='=ls -lSh -- *(.) | grep -v total | head $@ 2&>/dev/null'   # biggest files

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN) R|lsd'

# List only file beginning with "."
alias lsa='ls -ld .*'

# man
alias m1='man 1'
alias mpdf='man -Tpdf man >man.pdf'
alias mps='man -t man > man.ps'
alias mtxt='man -Ttxt man > man.txt'

function man_exp() {
    =man -Ttxt $@ > man.txt
}

# maven
alias mvc='mvn clean'
alias mvi='mvn install'
alias mvci='mvc && mvi'

# mount
alias mount='sudo mount'
alias umount='sudo umount'

# network
alias hosts='cat /etc/hosts'
alias pingd='ping -c3 archlinux.org'
alias resolv='cat /etc/resolv.conf'
alias dhcpcd='sudo dhcpcd'
alias ip='ip -color=auto'
alias ipe='curl ifconfig.me'
alias openvpn='sudo openvpn'

# path
alias path='echo $PATH | tr -s ":" "\n"'
alias ppath='print -l $PATH'
alias fpath='echo $FPATH | tr -s ":" "\n"'
#alias lpath='echo $LPATH | tr -s ":" "\n"'

# ps
alias pmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias ps='ps aux'

# python
alias py='python3'
alias pi='pip3'
alias pii='pip install'
alias freeze='pip freeze > requirements.txt'
alias requires='pip install -r requirements.txt'
alias sc='scrapy'
alias scc='scrapy crawl'
alias scs='scrapy shell'
alias server='python3 -m http.server'
alias venv='virtualenv venv && source ./venv/bin/activate'
alias json='python3 -m json.tool'
alias color='pygmentize -l pytb'

# sudo
alias chown='sudo chown'
alias fdisk='sudo fdisk'
alias journal='sudo journalctl --since=today -f'

# tar
alias targz='tar xzf'
alias targzc='tar -czvf'
alias tarc='tar -cvf'
alias tarbz2='tar xjf'
alias tarxz='tar xf'
alias tarls='tar tvf'

# tree
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'

# vim
alias vi='vim'
alias nano='vim'
alias emacs='vim'
alias sv='sudo vim'
alias vimplug='vim +PluginInstall +qall'



alias quote='shuf -n 1 ~/Quotables/author-quote.txt'









alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'

