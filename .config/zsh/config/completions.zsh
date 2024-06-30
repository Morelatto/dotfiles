#!/usr/bin/zsh

# Z-shell completion configuration

# Enable caching of all completion operations.  The results of completion
# functions are cached, so that subsequent completions of the same text can
# be done more quickly.
zstyle ':completion::complete:*' use-cache yes

# Set the directory for storing completion cache files.
# $ZSH_CACHE_DIR should be set to a directory with write access.
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# List of completers to be used for completion.
# This includes expansion of variables, command completion and approximate completions.
zstyle ':completion:*'  _expand _complete _approximate

# Approximate matching
# Maximum number of errors allowed for approximate completion.
# The number is calculated as one third of the sum of lengths of the prefix and suffix of the word being completed.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Configure the format of descriptions during completion. Bold format for descriptions.
zstyle ':completion:*:descriptions' format '%B%d%b'
# Configure the format of messages during completion. Plain format for messages.
zstyle ':completion:*:messages' format '%d'
# Configure the format of warnings during completion. Custom warning format.
zstyle ':completion:*:warnings' format 'No matches for: %d'
# Configure the format of corrections during completion. Bold format for corrections and show number of errors.
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Enables the grouping of completion options
zstyle ':completion:*' group-name ''

# Show directories before files in completion listings.
zstyle ':completion:*' list-dirs-first true

# Specify a list of matcher-list to allow completion to consider alternate matches if the default matcher fails.
# '' allows exact matches
# 'm:{a-z}={A-Z}' makes the match case-insensitive.
# 'r:|[._-]=* r:|=*' allows you to type the last character of a word, or anything after a . _ -, and have it match the rest of the word in the completion.
# 'l:|[._-]=* l:|=*' does the same but for the first character of the word or anything before a . _ -.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Enable the single-undo selection style
zstyle ':completion:*' menu select=2

# Configure color listings for completions based on LS_COLORS.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Configure colors for process listings in 'kill' completion.
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd --no-headers'
