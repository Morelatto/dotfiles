#!/usr/bin/env zsh
# Zsh options configuration - Enhanced from the full config

# History Configuration
SAVEHIST=$((2 ** 2 ** 5))  # 4294967296 entries
HISTSIZE=15000

# History Options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY        # Write to the history file immediately
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file
setopt HIST_VERIFY               # Do not execute immediately upon history expansion
setopt HIST_REDUCE_BLANKS        # Remove extra blanks from each command line

# Directory Options
setopt AUTO_CD                   # If command is a directory, cd into it
setopt AUTO_PUSHD                # Make cd push the old directory onto the stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates onto the stack
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd
setopt PUSHD_TO_HOME             # Push to home directory when no argument is given
setopt CDABLE_VARS               # Change directory to a path stored in a variable
setopt MULTIOS                   # Write to multiple descriptors
setopt EXTENDED_GLOB             # Use extended globbing syntax

# Completion Options
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word
setopt AUTO_LIST                 # Automatically list choices on ambiguous completion
setopt AUTO_MENU                 # Show completion menu on a successive tab press
setopt AUTO_PARAM_SLASH          # Add a trailing slash to directory names
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt MENU_COMPLETE             # Cycle through completions
setopt PATH_DIRS                 # Perform path search even on command names with slashes

# Globbing Options
setopt GLOB_DOTS                 # Include dotfiles in globbing
setopt NO_CASE_GLOB              # Case insensitive globbing
setopt NUMERIC_GLOB_SORT         # Sort numeric filenames numerically

# Error Handling
setopt NO_NOMATCH                # Don't error if glob doesn't match
setopt NO_BAD_PATTERN            # Don't error on bad patterns

# Input/Output Options
setopt CORRECT                   # Correct commands
setopt CORRECT_ALL               # Correct all arguments
setopt NO_FLOW_CONTROL           # Disable output flow control (ctrl+s/ctrl+q)
setopt IGNORE_EOF                # Do not exit on end-of-file (ctrl+d)
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shells
setopt RC_QUOTES                 # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'

# Job Control
setopt LONG_LIST_JOBS            # List jobs in the long format by default
setopt NOTIFY                    # Report status of background jobs immediately
setopt NO_BG_NICE                # Don't run all background jobs at a lower priority
setopt NO_CHECK_JOBS             # Don't report on jobs when shell exit
setopt NO_HUP                    # Don't kill jobs on shell exit

# Prompt Options
setopt PROMPT_SUBST              # Enable parameter expansion, command substitution, etc. in prompts
setopt TRANSIENT_RPROMPT         # Remove right prompt artifacts from prior commands

# Miscellaneous Options
unsetopt BEEP                    # No bell on error
unsetopt BG_NICE                 # Don't run background jobs at lower priority
unsetopt CHECK_JOBS              # Don't warn about running jobs when exiting

# Disable certain completions
unsetopt GLOB_COMPLETE           # Don't generate completions from globbing
unsetopt COMPLETE_ALIASES        # Don't complete aliases

# ZLE configuration
ZLE_REMOVE_SUFFIX_CHARS=""       # Don't remove suffix characters