#!/bin/zsh
# zsh 5.8.1
# man 1 zshoptions


export HISTFILE="$ZSH_CACHE/.zhistory"
SAVEHIST=1000
HISTSIZE=1500


setopt share_history hist_ignore_space
setopt glob_dots complete_in_word no_nomatch glob_subst no_bad_pattern
setopt auto_cd auto_pushd pushd_ignore_dups pushd_to_home
unsetopt glob_complete complete_aliases list_ambiguous beep

