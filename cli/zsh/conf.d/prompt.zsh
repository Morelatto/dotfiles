#!/usr/bin/env zsh
# Zsh Prompt Configuration

# Use starship if available
if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
else
    # Enable prompt substitution
    setopt PROMPT_SUBST

    # Colors
    autoload -U colors && colors

    # Git info function
    git_prompt_info() {
        local ref
        ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
        echo " %{$fg[yellow]%}(${ref#refs/heads/})%{$reset_color%}"
    }

    # Simple two-line prompt
    PROMPT='%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info)
%{$fg[green]%}❯%{$reset_color%} '

    # Right prompt with exit status
    RPROMPT='%(?.%{$fg[green]%}✓%{$reset_color%}.%{$fg[red]%}✗ %?%{$reset_color%})'
fi