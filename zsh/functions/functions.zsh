autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

source $ZFUNCTIONS/vi-mode.zsh
source $ZFUNCTIONS/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh
source $ZFUNCTIONS/zsh-syntax-highlighting.zsh
