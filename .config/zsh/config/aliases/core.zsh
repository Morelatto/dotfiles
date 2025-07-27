#!/usr/bin/env zsh
# Core aliases - Basic system and navigation commands

# Single letter shortcuts
alias a='alias'
alias b='bat'
alias c='oco'
alias d='dust'
alias f='fd'
alias g='gpt'
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
alias \$=''

# Directory navigation
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

# Common directories shortcuts
alias cdd='cd ~/Downloads'
alias cdc='cd ~/Documents'
alias cdp='cd ~/Pictures'

# Clipboard operations
alias copy='xsel -ib'
alias paste='xsel -o'
alias xcopy='xclip -sel clip'

# File operations
alias cp='cp -R'
alias md='mkdir'
alias mkdir='mkdir -p'
alias rf='readlink -f'
alias rmrf='rm -rf'
alias chx='chmod +x'

# ls aliases (using exa if available, fallback to ls)
if command -v exa &>/dev/null; then
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
else
    alias ls='ls --color=auto'
    alias la='ls -la'
    alias lr='ls -R'
    alias lra='ls -Ra'
    alias l.='ls -d .*'
fi

# List only directories and symbolic links that point to directories
alias lsd='ls -ld *(-/DN) 2>/dev/null || lsd'

# List only files beginning with "."
alias lsa='ls -ld .*'

# grep enhancements
alias grep='grep --color=auto --ignore-case'
alias fgrep='grep --fixed-strings'
alias egrep='grep --extended-regexp'
alias lgrep="grep -rnw '.' -e"
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

# Better defaults for common tools
alias df='df -h'
alias du='dust'
alias du1='dust -d 1'
alias dud='dust -d'
alias bat='bat --paging=never'
alias tf='tail -F'

# tree shortcuts
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'
alias t5='tree -L 5'

# Process management
alias ka='killall'
alias k9='kill -9'
alias pmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias psg='psgrep'

# Path utilities
alias path='echo $PATH | tr -s ":" "\n"'
alias ppath='print -l $PATH'
alias fpath='echo $FPATH | tr -s ":" "\n"'

# System utilities
alias all='alias'
alias off='xset dpms force off'
alias xrl='xrdb -load ~/.Xresources'
alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'
alias journal='sudo journalctl --since=today -f'

# Archive operations
alias targz='tar xzf'
alias targzc='tar -czvf'
alias tarc='tar -cvf'
alias tarbz2='tar xjf'
alias tarxz='tar xf'
alias tarls='tar tvf'

# Editor shortcuts
alias vi='vim'
alias nano='vim'
alias emacs='vim'
alias sv='sudo vim'
alias vimplug='vim +PluginInstall +qall'

# Mount operations
alias mount='sudo mount'
alias umount='sudo umount'

# Common tools shortcuts
alias cht='cht.sh'
alias fox='firefox'
alias pom='potato'
alias server='python3 -m http.server'
alias json='python3 -m json.tool'

# Cleanup operations
alias noeclipse="fd '\.(settings|classpath|factorypath|project)' -tf -X rm"
alias noidea="find . -type d -name '.idea' -exec rm -rf {} +"
alias nomac="fd -H '^\.DS_Store$' -tf -X rm"
alias nopyc="fd -H 'pyc(ache)?' -X rm -r"