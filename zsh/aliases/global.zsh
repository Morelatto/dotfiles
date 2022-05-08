# Global aliases -- These do not have to be
# at the beginning of the command line.
# Redirect and append both stdout and stderr to file
alias -g A='&>>'
alias -g C='|cat -A'
alias -g F='|fzf'
alias -g G='|grep'
alias -g H='|head -n'
alias -g L='|less'
alias -g M='|most'
alias -g N='2>/dev/null'
alias -g R='2>&1'
alias -g RC='R|color'
alias -g RL='R|L'
alias -g S='A /dev/null'
alias -g T='|tail'
alias -g J='|json'
alias -g X='|copy'

