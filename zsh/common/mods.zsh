#!/usr/bin/zsh

# --------------
# Plugin sources
# --------------

export ZMOD_DIR=$DOTDIR/zsh/mods

# https://github.com/zdharma-continuum/fast-syntax-highlighting
source $ZMOD_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# https://github.com/MichaelAquilina/zsh-you-should-use
source $ZMOD_DIR/you-should-use/you-should-use.plugin.zsh


# https://github.com/ellie/atuin
eval "$(atuin init zsh --disable-up-arrow)"


# https://github.com/zsh-users/zsh-autosuggestions
_zsh_autosuggest_strategy_atuin_top() {
    suggestion=$(atuin search --cmd-only --limit 1 --search-mode prefix $1)
}

ZSH_AUTOSUGGEST_STRATEGY=atuin_top
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source $ZMOD_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh


# https://github.com/zsh-users/zsh-history-substring-search
source $ZMOD_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# https://github.com/agkozak/zsh-z
source $ZMOD_DIR/zsh-z/zsh-z.plugin.zsh
autoload -U compinit; compinit
bindkey '^@'          _expand_alias


# https://github.com/romkatv/powerlevel10k
POWERLEVEL9K_INSTALLATION_DIR="$ZMOD_DIR/powerlevel10k/"
source $POWERLEVEL9K_INSTALLATION_DIR/powerlevel10k.zsh-theme
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1

# junegunn/fzf
# Aloxaf/fzf-tab
# mdumitru/fancy-ctrl-z
# zpm-zsh/history-search-multi-word

# pyenv setup
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source $(pyenv root)/completions/pyenv.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

