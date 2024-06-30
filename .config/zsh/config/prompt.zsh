#!/usr/bin/zsh

# Powerline
# function powerline_precmd() {
#     PS1="$(powerline-shell --shell zsh $?)"
# }

# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi

autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%{$fg[green]%} $%b "

# Set a more concise prompt
# PS1="%F{red}[%F{yellow}%n%f@%F{blue}%M %F{magenta}%~%F{red}]%f %F{green}\$%f "

# Explanation:
# %F sets the foreground color
# %f resets the color to the default foreground color
# %n represents the username
# %M represents the hostname
# %~ represents the current working directory (shortened if in the user's home directory)
# $ represents the regular shell prompt symbol

# Define colors for easier reading and modification
local RED='%F{red}'
local YELLOW='%F{yellow}'
local BLUE='%F{blue}'
local MAGENTA='%F{magenta}'
local GREEN='%F{green}'
local RESET='%f'

# Prompt string (PS1)
PS1="${GREEN}%n@%M:${BLUE}%~\$${RESET} "
