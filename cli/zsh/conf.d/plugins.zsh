#!/usr/bin/env zsh
# Essential plugins only

# Helper function
load_plugin() {
    local plugin=$1
    local paths=(
        "/usr/share/zsh/plugins/$plugin/$plugin.zsh"
        "/usr/share/$plugin/$plugin.zsh"
        "$HOME/.local/share/zsh/plugins/$plugin/$plugin.zsh"
    )

    for p in $paths; do
        [[ -f "$p" ]] && { source "$p"; return 0; }
    done
    return 1
}

# Load syntax highlighting first
load_plugin "zsh-syntax-highlighting"

# Atuin - disable up arrow key binding, load before autosuggestions
(( $+commands[atuin] )) && eval "$(atuin init zsh --disable-up-arrow)"

# Load autosuggestions after atuin for proper integration
load_plugin "zsh-autosuggestions" && {
    # Configure autosuggestions to work with atuin
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    # Use atuin first, then fallback to history and completion
    ZSH_AUTOSUGGEST_STRATEGY=(atuin history completion)
    # Faster suggestion buffer
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    # Accept suggestions with right arrow or end key
    ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char end-of-line vi-forward-char vi-end-of-line)
}

# FZF with proper feature detection
if (( $+commands[fzf] )); then
    [[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
    [[ -f "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"

    export FZF_DEFAULT_OPTS="--height 40% --reverse --border"
    # Only set preview if bat exists
    (( $+commands[bat] )) && \
        export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || cat {}'"
fi
