alias aee="$EDITOR $ZALIASES && source $ZCOMMON/aliases.zsh"
alias iee="$EDITOR $XDG_CONFIG_HOME/i3/config && i3-msg reload"
alias xee="$EDITOR ~/.Xresources && xrl"
alias zee="$EDITOR $ZDOTDIR"

# a-z
alias a='alias'
alias b='bat'
alias c='cat'
alias f='fd'
alias g='sgpt'
alias h='histdb'
alias j='z'
alias l='ls'
alias m='man'
alias p='pip'
alias q='exit'
alias s='sudo'
alias t='tree'
alias v='vim'
alias y='yay'

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

# docker
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcuf='docker-compose up -d --force-recreate'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcc="docker-compose config"
alias dcp='docker-compose pull'
alias dcl='docker-compose logs --tail=100 -f'
alias deit='docker exec -it'
alias dci='docker inspect'
alias dim='docker images'
alias dip='docker image prune -f'
alias dl='docker logs'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dr='docker restart'
alias drit='docker run -it'
alias drm='docker rm'
alias ds='docker start'
alias dsp='docker system prune --all'
alias lzd='lazydocker'

# ext
alias bat='batcat --paging=never'
alias cht='cht.sh'
alias du='dust'
alias du1='dust -d 1'
alias dud='dust -d'
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
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'
alias gua='git restore --staged'
alias gb='git branch'
alias gbl='git branch --list'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
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
alias authors="git ls-files | while read f; do git blame -w -M -C -C --line-porcelain \$f | grep -I '^author '; done 2>/dev/null | sort -f | uniq -ic | sort -n"

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
alias cp='cp -R'
alias df='df -h'
alias m1='man 1'
alias md='mkdir'
alias mkdir='mkdir -p'
alias off='xset dpms force off'
alias rf='readlink -f'
alias rmrf='rm -rf'
alias tf='tail -F'
alias xrl='xrdb -load ~/.Xresources'

# ls
alias ls='exa --colour=always'
alias la='exa -la'
alias lr='exa -R'
alias lra='exa -Ra'
alias l.='exa -d .*'
alias lse='exa --empty'
alias lsnew='exa --sort=modified --reverse'
alias lsold='exa --sort=modified'
alias lsmall='exa --sort=size'
alias lsbig='exa --sort=size --reverse'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN) R|lsd'

# List only file beginning with "."
alias lsa='ls -ld .*'

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
alias dns='resolvectl status'

# path
alias path='echo $PATH | tr -s ":" "\n"'
alias ppath='print -l $PATH'
alias fpath='echo $FPATH | tr -s ":" "\n"'
#alias lpath='echo $LPATH | tr -s ":" "\n"'

# ps
alias pmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'

# python
alias pip='pip3'
alias pi='pip install'
alias pu='pip uninstall'
alias pupg='pip install --upgrade pip'
alias pfr='pip freeze > requirements.txt'
alias pre='pip install -r requirements.txt'
alias py='python3'
alias sc='scrapy'
alias scc='scrapy crawl'
alias scs='scrapy shell'
alias server='python3 -m http.server'
alias venv='virtualenv venv && source ./venv/bin/activate'
alias json='python3 -m json.tool'
alias color='pygmentize -l pytb'
alias note='jupyter notebook'

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
alias t4='tree -L 4'
alias t5='tree -L 5'

# vim
alias vi='vim'
alias nano='vim'
alias emacs='vim'
alias sv='sudo vim'
alias vimplug='vim +PluginInstall +qall'



alias quote='shuf -n 1 ~/Quotables/author-quote.txt'









alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'

