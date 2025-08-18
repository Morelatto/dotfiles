#!/usr/bin/env zsh
# Shell Aliases - Essential shell operations, navigation, and global aliases

# =============================================================================
# Single Letter Shortcuts - Core System Tools
# =============================================================================
alias a='alias'
alias m='man'
alias q='exit'
alias s='sudo'

# =============================================================================
# Directory Navigation
# =============================================================================
alias .='cd ./'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Common directories shortcuts
alias cdd='cd ~/Downloads'
alias cdc='cd ~/Documents'
alias cdp='cd ~/Pictures'

# =============================================================================
# File Operations
# =============================================================================
alias cp='cp -Ri'    # Recursive and interactive
alias md='mkdir'

# =============================================================================
# Listing Files
# =============================================================================
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -p'
alias mv='mv -i'     # Interactive by default
alias rm='rm -i'     # Interactive by default
alias rf='readlink -f'
alias rmrf='rm -rf'  # Force removal shortcut

# =============================================================================
# Permissions
# =============================================================================
alias chx='chmod +x'
alias 755='chmod 755'
alias 644='chmod 644'

# =============================================================================
# System Utilities
# =============================================================================
alias tf='tail -F'
alias all='alias'
alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'

# Mount operations
alias mount='sudo mount'
alias umount='sudo umount'

# =============================================================================
# Path Utilities
# =============================================================================
path() {
    echo $PATH | tr -s ":" "\n"
}

fpath() {
    echo $FPATH | tr -s ":" "\n"
}

# =============================================================================
# Global Aliases - Can be used anywhere in the command line
# =============================================================================
alias -g A='&>>'          # Append stdout and stderr to file
alias -g C='|cat -A'      # Show invisible characters
alias -g F='|fzf'         # Pipe to fzf
alias -g G='|grep'        # Pipe to grep
alias -g H='|head -n'     # Pipe to head
alias -g L='|less'        # Pipe to less
alias -g M='|most'        # Pipe to most
alias -g N='2>/dev/null'  # Discard stderr
alias -g R='2>&1'         # Redirect stderr to stdout
alias -g RC='R|color'     # Colorize output
alias -g RL='R|L'         # Pipe stderr to less
alias -g S='A /dev/null'  # Discard all output
alias -g T='|tail'        # Pipe to tail
alias -g U='| uniq'       # Remove duplicates
alias -g J='|json'        # Format JSON
alias -g X='|copy'        # Copy to clipboard
alias -g W='| wc -l'      # Count lines