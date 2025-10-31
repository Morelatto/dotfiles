#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# ZSH Interactive Shell Configuration

: ${ZDOTDIR:=$HOME/.config/zsh}

# Optional performance profiling - set ZPROF=1 to enable
[[ -n "$ZPROF" ]] && zmodload zsh/zprof

# Add function directory to fpath and autoload
if [[ -d "$ZDOTDIR/functions" ]]; then
    fpath=("$ZDOTDIR/functions" $fpath)
    # Only autoload actual function files (not directories)
    local -a function_files=($ZDOTDIR/functions/*(-.N:t))
    if (( ${#function_files[@]} > 0 )); then
        autoload -Uz $function_files
    fi
fi

# Auto-source all configuration files from conf.d/
# Files are loaded in alphabetical order (use numbered prefixes to control order)
for config in $ZDOTDIR/conf.d/*.zsh(N); do
    source $config
done

# Local overrides (not tracked)
[[ -r "$ZDOTDIR/.zshrc.local" ]] && source "$ZDOTDIR/.zshrc.local"

# Show profiling results if enabled
[[ -n "$ZPROF" ]] && zprof
