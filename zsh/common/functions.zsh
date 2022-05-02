#!/usr/bin/zsh

fpath=(path/to/zsh-completions/src $fpath)
# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
# for func in $^fpath/*(N-.x:t); autoload $func

# ===
# FZF
# ===
# NOTE: fzf-tab needs to be loaded after compinit,
# but before plugins which will wrap widgets,
# such as zsh-autosuggestions or fast-syntax-highlighting!!
# source $DOTDIR/zsh/functions/fzf-tab/fzf-tab.plugin.zsh

# ====
# HSTR
# ====
# https://github.com/dvorka/hstr

export HSTR_CONFIG=hicolor,raw-history-view
#bindkey -s "\C-r" "\C-a hstr -- \C-j"

# ====================
# ZSH History Database
# ====================
# https://github.com/larkery/zsh-histdb
source $DOTDIR/zsh/functions/zsh-histdb/zsh-histdb.plugin.zsh
autoload -Uz add-zsh-hook

source $DOTDIR/zsh/functions/zsh-histdb/histdb-interactive.zsh

# ========
# AUTOJUMP
# ========
# https://github.com/wting/autojump
source /etc/profile.d/autojump.sh

# ===================
# ZSH AUTOSUGGESTIONS
# ===================
# https://github.com/zsh-users/zsh-autosuggestions

# This plugin works by triggering custom behavior when certain zle widgets are invoked.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disabling suggestion for large buffers
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=256

# export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
#     widget::key-right
#     widget::key-ctrl-space
# )

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# ===================
# SYNTAX HIGHLIGHTING
# ===================

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
# Use ranger to switch directories and bind it to ctrl-o
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}




fpath=($zdotdir/zsh/functions/zsh-completions/src $zfunctions $fpath)
