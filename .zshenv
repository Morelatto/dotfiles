# Main .zshenv - sets ZDOTDIR for yadm
# This file should be symlinked to ~/.zshenv by yadm

# Set ZDOTDIR to use XDG_CONFIG_HOME
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
