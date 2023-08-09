# Zsh Global aliases configuration
# Global aliases do not have to be at the beginning of the command line

# Append both stdout and stderr to a file.
# Usage: echo "Hello, World!" A filename.txt
alias -g A='&>>'

# Show invisible characters, equivalent to cat -A.
# Usage: echo -e "Hello\tWorld" C
alias -g C='|cat -A'

# Pipe to fzf for fuzzy searching.
# Usage: echo -e "apple\nbanana\ncherry" F
alias -g F='|fzf'

# Pipe to grep for pattern searching.
# Usage: echo -e "apple\nbanana\ncherry" G "an"
alias -g G='|grep'

# Pipe to head to limit output.
# Usage: echo -e "1\n2\n3\n4\n5" H 3
alias -g H='|head -n'

# Pipe to less for page-by-page viewing.
# Usage: cat large_file.txt L
alias -g L='|less'

# Pipe to most for advanced paging.
# Usage: cat large_file.txt M
alias -g M='|most'

# Discard stderr by redirecting to /dev/null.
# Usage: cat non_existent_file.txt N
alias -g N='2>/dev/null'

# Redirect stderr to stdout.
# Usage: cat non_existent_file.txt R
alias -g R='2>&1'

# Colorize output (Requires color command).
# Usage: cat non_existent_file.txt RC
alias -g RC='R|color'

# Pipe stderr to less.
# Usage: cat non_existent_file.txt RL
alias -g RL='R|L'

# Discard all output by redirecting to /dev/null.
# Usage: echo "Hello, World!" S
alias -g S='A /dev/null'

# Pipe to tail for viewing the end of files.
# Usage: cat large_file.txt T
alias -g T='|tail'

alias -g U='| uniq'

# Pipe to json for formatting JSON output (Requires json command).
# Usage: echo '{"hello":"world"}' J
alias -g J='|json'

# Copy output to clipboard (Requires copy command).
# Usage: echo "Hello, World!" X
alias -g X='|copy'

alias -g W='| wc -l'