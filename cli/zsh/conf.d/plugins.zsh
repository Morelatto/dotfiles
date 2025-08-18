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

# FZF before atuin (so atuin can override CTRL-R)
if (( $+commands[fzf] )); then
    [[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
    [[ -f "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"

    export FZF_DEFAULT_OPTS="--height 40% --reverse --border"
    # Only set preview if bat exists
    (( $+commands[bat] )) && \
        export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || cat {}'"
fi

# Atuin - full integration with up arrow (AFTER fzf to override CTRL-R)
(( $+commands[atuin] )) && eval "$(atuin init zsh)"

# Load autosuggestions after atuin for proper integration
load_plugin "zsh-autosuggestions" && {
    # Suggestion appearance (dim gray)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
    
    # Strategy: try history first, then completion
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    
    # Limit buffer size for performance (don't suggest for very long commands)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    
    # Ignore patterns - don't suggest these from history
    # ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"  # Example: ignore cd commands
    # ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"  # Example: ignore git subcommands
    
    # Use async mode (default for zsh 5.0.8+)
    # ZSH_AUTOSUGGEST_USE_ASYNC=true
    
    # Manual rebind for performance (advanced users only)
    # ZSH_AUTOSUGGEST_MANUAL_REBIND=1
}

# Mise - universal tool version manager (replaces fnm, pyenv, nvm, etc.)
(( $+commands[mise] )) && eval "$(mise activate zsh)"
