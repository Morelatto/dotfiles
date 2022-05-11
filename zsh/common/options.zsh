#!/bin/zsh
# zsh 5.8.1
# man 1 zshoptions

export HISTFILE="$ZSH_CACHE/.zhistory"
SAVEHIST=1000
HISTSIZE=1500

setopt share_history hist_ignore_space complete_in_word
setopt menu_complete glob_dots no_nomatch no_bad_pattern
setopt auto_cd auto_pushd pushd_ignore_dups pushd_to_home
unsetopt glob_complete complete_aliases beep

