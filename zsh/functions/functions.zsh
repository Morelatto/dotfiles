autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

source $ZFUNCTIONS/vi-mode.zsh
source $ZFUNCTIONS/expand-aliases.zsh
source $ZFUNCTIONS/time-functions.zsh
source $ZFUNCTIONS/zsh-autosuggestions.zsh
source $ZFUNCTIONS/history-search-multi-word/history-search-multi-word.plugin.zsh
source $ZFUNCTIONS/autojump.zsh
source $ZFUNCTIONS/zsh-completions/zsh-completions.plugin.zsh
source $ZFUNCTIONS/zsh-syntax-highlighting.zsh
