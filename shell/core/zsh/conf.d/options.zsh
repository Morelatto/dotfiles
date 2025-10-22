#!/usr/bin/env zsh
# History essentials
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY

# Navigation essentials
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB

# Safety/convenience
setopt NO_NOMATCH
setopt CORRECT
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS

unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Completion
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END