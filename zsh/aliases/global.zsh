# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g C='|cat -A'
alias -g F='|fzf '
alias -g G='|grep '
alias -g H='|head'
alias -g L='|less'
alias -g M='|more'
alias -g T='|tail'
alias -g J='|json'
alias -g X='|xcopy'
alias -g LL='2>&1|L'                # Writes stderr to stdout and passes it to less
alias -g CA='2>&1|C'                # Writes stderr to stdout and passes it to cat
alias -g NE='2>/dev/null'              # Silences stderr
alias -g NUL='> /dev/null 2>&1'         # Silences both stdout and stderr
alias -g P='2>&1| pygmentize -l pytb'   # Writes stderr to stdout and passes it to pygmentize
