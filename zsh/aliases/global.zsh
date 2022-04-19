alias -g G="| grep "
alias -g H="| head"
alias -g L="| less"
alias -g T="| tail"
alias -g J="| python3 -m json.tool"
alias -g X="| xsel -ib"

alias -g LL="2>&1 | less"               # Writes stderr to stdout and passes it to less
alias -g CA="2>&1 | cat -A"             # Writes stderr to stdout and passes it to cat
alias -g NE="2> /dev/null"              # Silences stderr
alias -g NUL="> /dev/null 2>&1"         # Silences both stdout and stderr
alias -g P="2>&1| pygmentize -l pytb"   # Writes stderr to stdout and passes it to pygmentize
