#!/usr/bin/env zsh
# Python - Lazy loaded configuration

# Only load if python3 is installed
(( $+commands[python3] )) || return 0

# Initialize pyenv immediately (not lazy-loaded) to avoid virtualenv activation errors
if (( $+commands[pyenv] )); then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Create lazy-loading function stubs that load the real aliases on first use
_load_python_aliases() {
    # Remove the stub functions
    unfunction py python p pi pu pupg pfr pre venv vact pylab pynote pyclean pycache pytree pytest 2>/dev/null
    
    # Python basics
    alias py='python3'
    alias python='python3'
    
    # Package management - pip
    alias p='pip'
    alias pi='pip install'
    alias pu='pip uninstall'
    alias pupg='pip install --upgrade pip'
    alias pfr='pip freeze > requirements.txt'
    alias pre='pip install -r requirements.txt'

    # Package management - uv (modern Python package manager)
    if (( $+commands[uv] )); then
        alias uvs='uv sync'
        alias uvsd='uv sync --dev'
        alias uva='uv add'
        alias uvad='uv add --dev'
        alias uvr='uv remove'
        alias uvrun='uv run'
        alias uvvenv='uv venv'
        alias uvact='source .venv/bin/activate'
        alias uvpi='uv pip install'
        alias uvpie='uv pip install -e .'
        alias uvpu='uv pip uninstall'
        alias uvpl='uv pip list'
        alias uvtooli='uv tool install'
        alias uvtoolr='uv tool run'
    fi

    # Virtual environments with pyenv
    alias venv='python -m venv .venv && source .venv/bin/activate'
    alias vact='source .venv/bin/activate'
    
    # Interactive Python
    alias pylab='ipython --pylab'
    alias pynote='jupyter notebook'
    
    # Cleanup
    alias pyclean='find . -type f -name "*.py[co]" -delete; find . -type d -name "__pycache__" -delete'
    alias pycache='find . -type d -name "__pycache__" -exec rm -rf {} +'
    
    # Tools
    alias pytree='tree -I "__pycache__|*.pyc|*.pyo"'
    alias pytest='python -m pytest'
    
    # Pyenv build optimizations
    export PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto'
    export PYTHON_CFLAGS='-march=native -mtune=native'
    export MAKE_OPTS="-j$(nproc)"
    
    # Pyenv build optimizations only (initialization moved above)
}

# Create stub functions for the most common commands
for cmd in py python p pi pu pupg pfr pre venv vact pylab pynote pyclean pycache pytree pytest; do
    eval "function $cmd() {
        _load_python_aliases
        eval \"\$aliases[$cmd]\" \"\$@\"
    }"
done

# =============================================================================
# Python Project Cleanup
# =============================================================================
nopyc() {
    find . -name '*.pyc' -delete && find . -name '__pycache__' -type d -exec rm -rf {} +
}

# =============================================================================
# Development Server
# =============================================================================
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}