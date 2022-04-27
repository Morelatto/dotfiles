#!/usr/bin/zsh

# Where to look for autoloaded function definitions
fpath=($fpath $ZFUNCTIONS)

# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
for func in $^fpath/*(N-.x:t); autoload $func

# ====
# HSTR
# ====
# https://github.com/dvorka/hstr

export HSTR_CONFIG=hicolor,raw-history-view

# ========
# AUTOJUMP
# ========
# https://github.com/wting/autojump
source /etc/profile.d/autojump.sh

# ===
# FZF
# ===
# NOTE: fzf-tab needs to be loaded after compinit,
# but before plugins which will wrap widgets,
# such as zsh-autosuggestions or fast-syntax-highlighting!!
# source /home/morel/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh

# ===================
# ZSH AUTOSUGGESTIONS
# ===================
# https://github.com/zsh-users/zsh-autosuggestions
# Disabling suggestion for large buffers
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=256
# export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
#     widget::key-right
#     widget::key-ctrl-space
# )
# This plugin works by triggering custom behavior when certain zle widgets are invoked.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ===================
# SYNTAX HIGHLIGHTING
# ===================

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
