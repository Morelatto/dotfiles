ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="lambda-mod"

export UPDATE_ZSH_DAYS=7

ENABLE_CORRECTION="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

alias ls='ls -l --color=auto --indicator-style=classify'
alias la='ls -Alh'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ffox='firefox'

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
   exec startx
fi
