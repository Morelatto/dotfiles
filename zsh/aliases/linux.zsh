# a-z
alias c='cat'
alias f='find'
alias l='ls -l'
alias m='man'
alias p='ps -xe --forest'
alias q='exit'
alias s='sudo'
alias t='tree'
alias v='vim'

# cd
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# du
alias dua='du -s *(/DN) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # all directories sorted by size
alias duv='du -s ^.*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'   # visible directories sorted by size
alias duh='du -s .*(/N) | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'    # hidden directories sorted by size

# find
alias fdd='find . -type d'
alias ff='find . -type f'

# grep
alias grep='grep --color=auto --ignore-case'
alias fgrep='grep --fixed-strings'
alias egrep='grep --extended-regexp'
alias lgrep='grep -rnw '.' -e'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

# kill
alias ka='killall'
alias k9='kill -9'

# linux
alias chx='chmod +x'
alias cp='cp -r'
alias diff='diff --color=auto'
alias df='df -h'
alias mkdir='mkdir -p'
alias md='mkdir'
alias rf='readlink -f'
alias rmrf='rm -rf'
alias tf='tail -F'

# ls
alias ls='ls -Fh --color=always'
alias lsa='ls -A'
alias ll='ls -l'
alias la='ls -lA'
alias lr='ls -R'
alias llr='ll -R'
alias lra='lr -A'
alias l.='ls -d .*'

# more ls
alias lse='ls -d -- *(/^F)'                                             # empty directories
alias lsen='ls -d *(/om[1])'                                            # newest directory
alias lsx='ls -l -- *(*) | head $@ 2&>/dev/null'                        # executables
alias lsnew='=ls -rtlh -- *(.) | tail $@ 2&>/dev/null'                  # newest files
alias lsold='=ls -rtl -- *(.) | head $@ 2&>/dev/null'                   # oldest files
alias lsmall='=ls -Sl -- *(.) | tail $@ 2&>/dev/null'                   # smallest files
alias lsbig='=ls -lSh -- *(.) | grep -v total | head $@ 2&>/dev/null'   # biggest files

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

# ps
alias pp='psgrep'
alias pmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'

# sudo
alias chown='sudo chown'
alias fdisk='sudo fdisk'
alias journal='sudo journalctl --since=today'

# tar
alias targz='tar xzf'
alias targzc='tar -czvf'
alias tarc='tar -cvf'
alias tarbz2='tar xjf'
alias tarxz='tar xf'
alias tarls='tar tvf'

# vim
alias vi='vim'
alias nano='vim'
alias emacs='vim'
alias sv='sudo vim'
alias vimplug='vim +PluginInstall +qall'

# utils
alias aee="$EDITOR $ZALIASES && source $ZCOMMON/aliases.zsh"
alias cat='bat --paging=never'
alias cht='cht.sh'
alias fox='firefox'
alias i3e="$EDITOR $XDG_CONFIG_HOME/i3/config && i3-msg reload"
alias noeclipse='rm -rf .settings .classpath .factorypath .project'
alias nomac='find . -name '.DS_Store' -type f -delete'
alias noidea='find . -type d -name .idea -ls -exec rm -rf {} +'
alias off='xset dpms force off'
alias paste='xsel -o'
alias path='echo $PATH | tr -s ":" "\n"'
alias fpath='echo $FPATH | tr -s ":" "\n"'
alias xre="$EDITOR ~/.Xresources && xrl"
alias xrl='xrdb -load ~/.Xresources'
alias zshe="$EDITOR $ZDOTDIR"
alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'
alias quote='shuf -n 1 ~/Quotables/author-quote.txt'
