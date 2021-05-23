# History
HISTFILE=$ZSH_CACHE/.zsh_history # The path to the history file.
SAVEHIST=10000                  # The maximum number of events to save in the history file.
HISTSIZE=10000                  # The maximum number of events to save in the internal history.

setopt SHARE_HISTORY            # Share history between all sessions.
setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format.
setopt HIST_REDUCE_BLANKS       # Remove extra blanks from each command line being added to history.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history.

# Completion
setopt COMPLETE_IN_WORD         # Complete from both ends of a word.
setopt ALWAYS_TO_END            # Move cursor to the end of a completed word.
setopt PATH_DIRS                # Perform path search even on command names with slashes.
setopt AUTO_PARAM_SLASH         # If completed parameter is a directory, add a trailing slash.
setopt NO_NOMATCH               # Passes bad match onto the command.

# Directory
setopt AUTO_CD                  # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD               # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS        # Do not store duplicates in the stack.
setopt PUSHD_TO_HOME            # Push to home directory when no argument is given.

# Glob
setopt GLOB_DOTS                # Dot files included in regular globs.
setopt NO_BAD_PATTERN           # Allow unquoted globs to pass through.

# I/O
setopt NO_CLOBBER               # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.
setopt RM_STAR_SILENT           # Do not query the user before executing 'rm *' or 'rm path/*'.
setopt INTERACTIVE_COMMENTS     # Enable comments in interactive shells.

# Prompt
setopt TRANSIENT_RPROMPT        # Only show the rprompt on the current prompt.

# Sound
setopt NO_BEEP                  # Silence all bells and beeps.
