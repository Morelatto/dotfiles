#!/usr/bin/zsh

# zsh 5.8.1
# man 1 zshoptions

# Set the location of the history file. This file stores the command history between sessions.
export HISTFILE="$ZSH_CACHE_DIR/.zhistory"

# The 'SAVEHIST' variable determines the number of history events to be saved in the history file.
SAVEHIST=$((2 ** 2 ** 5))

# The 'HISTSIZE' variable sets the number of commands to keep in the history list of the current session.
HISTSIZE=15000

# Enable real-time sharing of the command history among all active shells.
# This includes saving history as commands are executed and removing duplicates from the beginning of the history list.
setopt share_history

# Commands that begin with a space are excluded from the history list.
# This is useful when dealing with sensitive information that shouldn't be stored.
setopt hist_ignore_space

# Enable completion from within a word, allowing for partial matches.
# This can help speed up command input.
setopt complete_in_word

# Rather than listing possible completions, cycle through them one at a time.
# This can be smoother and more efficient when dealing with a large number of potential matches.
setopt menu_complete

# Include filenames starting with a dot ('.') in globbing (pattern-matching).
# This is helpful when frequently dealing with hidden files.
setopt glob_dots

# Prevents an error from being raised when a glob does not match any files.
# Instead, the pattern is left as is. This can reduce interruptions when writing scripts.
setopt no_nomatch

# Prevents an error due to bad patterns.
# Patterns causing errors are treated as if they did not match, similar to the 'no_nomatch' option.
setopt no_bad_pattern

# If a command name is a directory and can't be executed as a normal command,
# change to that directory as if 'cd' was used before it.
setopt auto_cd

# Before changing to a new directory, push the old directory onto the stack.
# This allows quick switching back and forth between directories.
setopt auto_pushd

# Do not store duplicate entries on the directory stack.
# This can keep the stack uncluttered.
setopt pushd_ignore_dups

# When 'pushd' is used without arguments, push the home directory onto the directory stack.
# This is useful for quick access to the home directory.
setopt pushd_to_home

# Disable completion of filenames for glob patterns.
# This can make globbing more predictable by preventing unintended completions.
unsetopt glob_complete

# Disable completion of aliases.
# This can make it easier to use the original commands without unintentionally triggering alias completions.
unsetopt complete_aliases

# Turn off the terminal beep for events like tab completions.
# This can make the shell quieter and less distracting.
unsetopt beep

# Allow comments to begin at any position in the line, not just at the beginning.
# Particularly useful in interactive sessions for temporarily disabling parts of complex command lines.
setopt interactive_comments

# Allows command substitution to be performed in prompts.
# This allows the use of dynamic prompts that can include various kinds of information,
# such as the current time, the status of the last command, or the current directory.
setopt prompt_subst
