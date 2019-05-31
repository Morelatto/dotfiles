autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

source $ZFUNCTIONS/expand-aliases.zsh
source $ZFUNCTIONS/time-functions.zsh
