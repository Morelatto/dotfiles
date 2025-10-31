#\!/usr/bin/env zsh
# =============================================================================
# Lazy-Load Docker
# =============================================================================
if (( $+commands[docker] )); then
    _load_docker_aliases() {
        # Remove the stub functions
        unfunction dk dc dps dpsa di dex dlog dcu dcd dcr dclean drmi dsh 2>/dev/null

        # Essential docker aliases
        alias dk='docker'
        alias dc='docker-compose'
        alias dps='docker ps'
        alias dpsa='docker ps -a'
        alias di='docker images'
        alias dex='docker exec -it'
        alias dlog='docker logs -f'
        alias dcu='docker-compose up -d'
        alias dcd='docker-compose down'
        alias dcr='docker-compose restart'

        # Cleanup aliases
        alias dclean='docker system prune -af --volumes'
        alias drmi='docker rmi $(docker images -q -f dangling=true) 2>/dev/null || echo "No dangling images"'

        # Docker utility functions
        dsh() {
            local container="${1:-}"
            [[ -z "$container" ]] && {
                echo "Usage: dsh <container-name-or-id>"
                echo "Running containers:"
                docker ps --format "table $(echo '{' '{.Names}' '}' '\t' '{' '{.Image}' '}' '\t' '{' '{.Status}' '}' | tr -d ' ')"
                return 1
            }

            # Try to exec with bash first, fallback to sh
            docker exec -it "$container" bash 2>/dev/null || docker exec -it "$container" sh
        }
    }

    # Create stub functions that trigger loading on first use
    for cmd in dk dc dps dpsa di dex dlog dcu dcd dcr dclean drmi; do
        eval "function $cmd() {
            _load_docker_aliases
            eval \"\$aliases[$cmd]\" \"\$@\"
        }"
    done

    # Special handling for dsh function
    function dsh() {
        _load_docker_aliases
        dsh "$@"
    }
fi
