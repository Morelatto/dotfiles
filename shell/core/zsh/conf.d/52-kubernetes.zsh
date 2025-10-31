#\!/usr/bin/env zsh
# =============================================================================
# Lazy-Load Kubectl
# =============================================================================
if (( $+commands[kubectl] )); then
    _load_kubectl_aliases() {
        # Remove the stub functions
        unfunction k kg kd 2>/dev/null

        # Core aliases
        alias k='kubectl'
        alias kg='kubectl get'
        alias kd='kubectl describe'

        # Load kubectl completion if available
        if [[ -n "${commands[kubectl]}" ]]; then
            source <(kubectl completion zsh)
        fi
    }

    # Create stub functions that trigger loading on first use
    for cmd in k kg kd; do
        eval "function $cmd() {
            _load_kubectl_aliases
            eval \"\$aliases[$cmd]\" \"\$@\"
        }"
    done
fi
