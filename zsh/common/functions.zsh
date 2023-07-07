#!/usr/bin/zsh

# Initialize Zsh's completion system. This command prepares the use of the
# built-in completion system by loading all the necessary functions and
# setting up various options and key bindings.
autoload -Uz compinit
compinit

# Load zsh complist module to enable advanced menu completion features.
zmodload -i zsh/complist

# Append the directory of external function definitions to the function search path.
fpath+=(path/to/zsh-completions/src $ZFUNCTIONS)

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