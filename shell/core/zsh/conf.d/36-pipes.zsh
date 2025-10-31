#!/usr/bin/env zsh
# Global Aliases - Shell composition operators

# =============================================================================
# Global Aliases - Can be used anywhere in the command line
# =============================================================================
# These aliases allow for powerful command composition and pipeline building
# Usage: command G pattern    ->  command | grep pattern
#        cat file L           ->  cat file | less
#        ls F                 ->  ls | fzf

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
