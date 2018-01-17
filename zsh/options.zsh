if (( ! EUID )); then
    HISTFILE=$ZSH_CACHE/history_root
else
    HISTFILE=$ZSH_CACHE/history
fi

SAVEHIST=10000
HISTSIZE=12000

# history
setopt SHARE_HISTORY 
setopt APPEND_HISTORY 
setopt EXTENDED_HISTORY 
setopt HIST_NO_STORE 
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_IGNORE_SPACE

# completion
setopt HASH_LIST_ALL
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt LIST_AMBIGUOUS

# cd
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# glob
setopt EXTENDED_GLOB
setopt NOMATCH
setopt GLOB_DOTS

# I/O
setopt NO_CLOBBER
setopt RM_STAR_SILENT
setopt INTERACTIVE_COMMENTS

# prompt
setopt TRANSIENT_RPROMPT

# sound
setopt NO_BEEP
