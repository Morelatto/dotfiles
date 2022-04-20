fpath=($fpath $ZFUNCTIONS/time-functions.zsh)

source $ZFUNCTIONS/time-functions.zsh
source $ZFUNCTIONS/rangercd.zsh
source $ZFUNCTIONS/ctrlz.zsh
source $ZFUNCTIONS/hstr.zsh

# https://github.com/wting/autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
source /home/morel/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh

# https://github.com/zsh-users/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disabling suggestion for large buffers
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.zsh 2> /dev/null
