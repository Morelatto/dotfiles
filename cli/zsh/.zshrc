#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# ZSH Interactive Shell Configuration

: ${ZDOTDIR:=$HOME/.config/zsh}

# Optional performance profiling - set ZPROF=1 to enable
[[ -n "$ZPROF" ]] && zmodload zsh/zprof

# Colored man pages (inline, not as separate file)
export LESS_TERMCAP_mb=$'\e[1;31m'    # begin blinking
export LESS_TERMCAP_md=$'\e[1;36m'    # begin bold
export LESS_TERMCAP_me=$'\e[0m'       # end mode
export LESS_TERMCAP_se=$'\e[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\e[1;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'       # end underline
export LESS_TERMCAP_us=$'\e[1;32m'    # begin underline

# Modern diff with color support
if diff --color /dev/null{,} &>/dev/null 2>&1; then
    alias diff='diff --color'
fi

# Add function directory to fpath and autoload
if [[ -d "$ZDOTDIR/functions" ]]; then
    fpath=("$ZDOTDIR/functions" $fpath)
    # Only autoload actual function files (not directories)
    local -a function_files=($ZDOTDIR/functions/*(-.N:t))
    if (( ${#function_files[@]} > 0 )); then
        autoload -Uz $function_files
    fi
fi

# Load modular configuration in explicit order (2025 best practice)
local -a config_order=(
    options        # Set zsh options first
    aliases        # Load core aliases
    completion     # Setup completion system
    keybindings    # Configure key bindings
    plugins        # Load plugin configurations
    prompt         # Setup prompt (depends on plugins)
)

for config in $config_order; do
    local config_file="$ZDOTDIR/conf.d/$config.zsh"
    [[ -r "$config_file" ]] && source "$config_file"
done

# Load consolidated plugins (always load for modern CLI tools)
for plugin in cli-tools.zsh dev-tools.zsh system-tools.zsh; do
    [[ -r "$ZDOTDIR/plugins/$plugin" ]] && source "$ZDOTDIR/plugins/$plugin"
done

# Load specific plugins for available commands (lazy-loaded where applicable)
local -A available_plugins=(
    docker    docker-lazy.zsh
    kubectl   kubectl-lazy.zsh
    python3   python-lazy.zsh
    pacman    archlinux.zsh
    xsel      desktop.zsh
)

for cmd plugin in ${(kv)available_plugins}; do
    if (( $+commands[$cmd] )) && [[ -r "$ZDOTDIR/plugins/$plugin" ]]; then
        source "$ZDOTDIR/plugins/$plugin"
    fi
done

# Local overrides (not tracked)
[[ -r "$ZDOTDIR/.zshrc.local" ]] && source "$ZDOTDIR/.zshrc.local"

# Note: Node.js now managed by mise, FNM removed to avoid conflicts

# Show profiling results if enabled
[[ -n "$ZPROF" ]] && zprof
