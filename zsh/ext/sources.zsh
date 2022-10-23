#!/usr/bin/zsh

# ===
# fzf
# ===

# https://github.com/junegunn/fzf

# source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export FZF_COMPLETION_TRIGGER=''
# export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="\
  --ansi \
  --cycle \
  --layout='reverse' \
  --height='20' \
  --preview='(highlight -O ansi -l {} 2> /dev/null || bat --style=numbers --color=always {} || cat {} || tree -L 2 -C {}) 2> /dev/null | head -200' \
  --preview-window='right:70%:noborder' \
  --bind='?:toggle-preview' \
  --bind='tab:down' \
"
export FZF_DEFAULT_COMMAND_OPTS="
  --hidden \
  --follow \
  --type='f' \
  --exclude='.git' \
"
export FZF_CTRL_R_OPTS="
  --sort \
  --exact \
  --preview-window='down:3:hidden:wrap' \
"
export FZF_CTRL_T_OPTS="
  --select-1 \
  --exit-0 \
"
export FZF_ALT_C_OPTS="
  --select-1 \
  --exit-0 \
"
export FZF_DEFAULT_COMMAND="fd ${FZF_DEFAULT_COMMAND_OPTS}"

# https://github.com/Aloxaf/fzf-tab
# source $DOTDIR/zsh/ext/fzf-tab/fzf-tab.plugin.zsh

# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:ls:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:*' popup-pad 30 0 # set a bigger width to the popup win
# # switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'
# zstyle ':fzf-tab:*' fzf-command fzf

# give a preview of commandline arguments when completing `kill`
# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
#   '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
#     'git diff $word | delta'|
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
#     'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
#     'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
#     'case "$group" in
#     "commit tag") git show --color=always $word ;;
#     *) git show --color=always $word | delta ;;
#     esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
#     'case "$group" in
#     "modified file") git diff $word | delta ;;
#     "recent commit object name") git show --color=always $word | delta ;;
#     *) git log --color=always $word ;;
#     esac'

# ==========
# zsh-histdb
# ==========

# https://github.com/larkery/zsh-histdb

source $DOTDIR/zsh/ext/zsh-histdb/zsh-histdb.plugin.zsh

# ==========
# fzf-histdb
# ==========

# https://github.com/m42e/zsh-histdb-skim

source $DOTDIR/zsh/ext/zsh-histdb-skim/zsh-histdb-skim.zsh

export HISTDB_SKIM_PATH=${HOME}/.local/share/zsh-histdb-skim

# ========
# autojump
# ========

# https://github.com/wting/autojump

source /etc/profile.d/autojump.sh

# ===================
# zsh-autosuggestions
# ===================

# https://github.com/zsh-users/zsh-autosuggestions

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=256

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="
        SELECT commands.argv
        FROM history
        LEFT JOIN commands ON history.command_id = commands.rowid
        LEFT JOIN places ON history.place_id = places.rowid
        WHERE commands.argv LIKE '$(sql_escape $1)%'
        AND places.dir = '$(sql_escape $PWD)'
        GROUP BY commands.argv
        ORDER BY count(*) DESC
        LIMIT 1
    "
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top_here history)

# =======================
# zsh-syntax-highlighting
# =======================

# https://github.com/zsh-users/zsh-syntax-highlighting

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# ---------------
# Shell functions
# ---------------

setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
dot() { ln -sf $DOTDIR/$@ $(pwd) }
man_exp() { =man -T$2 $1 > $1.$2 }