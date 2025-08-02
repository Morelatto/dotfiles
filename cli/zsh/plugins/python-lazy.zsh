#!/usr/bin/env zsh
# Python - Lazy loaded configuration

# Only load if python3 is installed
(( $+commands[python3] )) || return 0

# Create lazy-loading function stubs that load the real aliases on first use
_load_python_aliases() {
    # Remove the stub functions
    unfunction py pyi p pi pu pupg pfr pre venv vact pyv pylab pynote pyclean pycache pytree pytest 2>/dev/null
    
    # Python basics
    alias py='python3'
    alias pyi='pyenv install'
    
    # Pip package management  
    alias p='pip'
    alias pi='pip install'
    alias pu='pip uninstall'
    alias pupg='pip install --upgrade pip'
    alias pfr='pip freeze > requirements.txt'
    alias pre='pip install -r requirements.txt'
    
    # Virtual environments
    alias venv='virtualenv venv && source ./venv/bin/activate'
    alias vact='source ./venv/bin/activate'
    alias pyv='python3 -m venv'
    
    # Interactive Python
    alias pylab='ipython --pylab'
    alias pynote='jupyter notebook'
    
    # Cleanup
    alias pyclean='find . -type f -name "*.py[co]" -delete; find . -type d -name "__pycache__" -delete'
    alias pycache='find . -type d -name "__pycache__" -exec rm -rf {} +'
    
    # Tools
    alias pytree='tree -I "__pycache__|*.pyc|*.pyo"'
    alias pytest='python -m pytest'
    
    # Load pyenv if available
    if (( $+commands[pyenv] )); then
        eval "$(pyenv init -)"
        (( $+commands[pyenv-virtualenv] )) && eval "$(pyenv virtualenv-init -)"
    fi
}

# Create stub functions for the most common commands
for cmd in py p pi venv vact; do
    eval "function $cmd() { 
        _load_python_aliases
        '$cmd' \"\$@\"
    }"
done