# https://zsh.sourceforge.io/Doc/Release/Options.html

# History
HISTFILE=$ZSH_CACHE/.history    # The path to the history file
SAVEHIST=20000                  # The maximum number of events to save in the history file
HISTSIZE=20000                  # The maximum number of events to save in the internal history
export HISTFILE					# Export for hstr

setopt SHARE_HISTORY            # Share history between all sessions
setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format
setopt HIST_REDUCE_BLANKS       # Remove extra blanks from each command line being added to history
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_SPACE 		# Remove command lines from the history list when the first character on the line is a space

# Completion
setopt COMPLETE_IN_WORD         # Complete from both ends of a word
setopt ALWAYS_TO_END            # Move cursor to the end of a completed word
setopt AUTO_MENU           		# Show completion menu on a succesive tab press
setopt AUTO_LIST				# Automatically list choices on ambiguous completions
unsetopt LIST_AMBIGUOUS
setopt AUTO_PARAM_SLASH         # If completed parameter is a directory, add a trailing slash
setopt NO_NOMATCH               # Passes bad match onto the command
unsetopt MENU_COMPLETE    		# Do not autoselect the first completion entry
setopt   GLOB_COMPLETE     		# Show completions for glob instead of expanding


# Directory
setopt AUTO_CD                  # Auto changes to a directory without typing cd
setopt AUTO_PUSHD               # Push the old directory onto the stack on cd
setopt PUSHD_IGNORE_DUPS        # Do not store duplicates in the stack
setopt PUSHD_TO_HOME            # Push to home directory when no argument is given

# Glob
setopt GLOB_DOTS                # Dot files included in regular globs
setopt NO_BAD_PATTERN           # Allow unquoted globs to pass through

# I/O
setopt NO_CLOBBER               # Do not overwrite existing files with > and >>. Use >! and >>! to bypass
setopt RM_STAR_SILENT           # Do not query the user before executing 'rm *' or 'rm path/*'
setopt INTERACTIVE_COMMENTS     # Enable comments in interactive shells

# Prompt
setopt TRANSIENT_RPROMPT        # Only show the rprompt on the current prompt

# Sound
setopt NO_BEEP                  # Silence all bells and beeps
