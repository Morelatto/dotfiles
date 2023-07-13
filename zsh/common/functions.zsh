#!/usr/bin/zsh

# Append the directory of external function definitions to the function search path.
fpath+=($DOTDIR/zsh/mods/zsh-completions/src $ZFUNCTIONS)

# ---------------
# Shell functions
# ---------------

setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
dot() { ln -sf $DOTDIR/$@ $(pwd) }
man_exp() { =man -T$2 $1 > $1.$2 }

# Use diff --color if available
if command diff --color /dev/null{,} &>/dev/null; then
  function diff {
    command diff --color "$@"
  }
fi