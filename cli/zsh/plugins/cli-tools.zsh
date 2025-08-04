#!/usr/bin/env zsh
# Modern CLI Tools - Consolidated configuration for common CLI replacements

# =============================================================================
# Bat - Better cat with syntax highlighting
# =============================================================================
if (( $+commands[bat] )); then
    alias cat='bat'
    alias less='bat --paging=always'
    alias b='bat'
    alias bp='bat --plain'
    alias bpp='bat --plain --paging=never'
    alias bl='bat --line-range'
    alias bn='bat --number'
    alias bd='bat --diff'
fi

# =============================================================================
# Eza - Modern ls replacement
# =============================================================================
# Basic listing shortcut
alias l='ls'

# Eza enhancements (if available)
if (( $+commands[eza] )); then
    alias ls='eza --colour=always'
    alias ll='eza -l'
    alias la='eza -la'
    alias lr='eza -R'
    alias lra='eza -Ra'
    alias l.='eza -d .*'
    
    # Eza-specific features
    alias lse='eza --empty'
    alias lsnew='eza --sort=modified --reverse'
    alias lsold='eza --sort=modified'
    alias lsmall='eza --sort=size'
    alias lsbig='eza --sort=size --reverse'
    
    # Tree-style output
    alias lst='eza --tree'
    alias lst2='eza --tree --level=2'
    alias lst3='eza --tree --level=3'
    
    # Git integration
    alias lsg='eza --git'
    alias lsga='eza -la --git'
fi

# =============================================================================
# Fd - Better find
# =============================================================================
if (( $+commands[fd] )); then
    alias find='fd'
    alias ff='fd'
    alias fh='fd --hidden'
    alias fd1='fd --max-depth 1'
    alias fd2='fd --max-depth 2'
    alias fd3='fd --max-depth 3'
    alias fdf='fd --type f'
    alias fdd='fd --type d'
    alias fdl='fd --type l'
    alias fdx='fd --type x'
    alias fde='fd --extension'
    alias fds='fd --size'
    alias fdc='fd --changed-within'
    alias fdm='fd --changed-before'
    alias fdu='fd --exclude'
    alias fdi='fd --ignore-case'
    alias fdp='fd --full-path'
fi

# =============================================================================
# Ripgrep - Better grep
# =============================================================================
if (( $+commands[rg] )); then
    alias grep='rg --color=auto --ignore-case'
    alias lgrep='rg'
    alias sgrep='rg --context=5'
    
    # Ripgrep-specific aliases
    alias rg='rg'
    alias rgf='rg --files'
    alias rgi='rg -i'
    alias rgw='rg -w'
    alias rgn='rg -n'
    alias rgc='rg --count'
    alias rgl='rg --files-with-matches'
fi

# =============================================================================
# Dust - Better du with visualization
# =============================================================================
if (( $+commands[dust] )); then
    alias du='dust'
    alias du1='dust -d 1'
    alias dud='dust -d'
    
    # Dust-specific features
    alias dust1='dust -d 1'
    alias dust2='dust -d 2'
    alias dust3='dust -d 3'
    alias dustn='dust -n'
    alias dustb='dust -b'
    alias dustr='dust -r'
fi

# =============================================================================
# Tree - Directory tree visualization
# =============================================================================
if (( $+commands[tree] )); then
    # Level shortcuts
    alias t1='tree -L 1'
    alias t2='tree -L 2'
    alias t3='tree -L 3'
    alias t4='tree -L 4'
    alias t5='tree -L 5'
    
    # Tree options
    alias treed='tree -d'
    alias treef='tree -f'
    alias treea='tree -a'
    alias treel='tree -L'
fi

# =============================================================================
# Pomodoro Timer
# =============================================================================
if (( $+commands[potato] )); then
    alias pom='potato'
    alias pom25='potato 25'
    alias pom5='potato 5'
    alias pomwork='potato 25'
    alias pombreak='potato 5'
fi

# =============================================================================
# AI Tools - Shell GPT
# =============================================================================
if (( $+commands[sgpt] )); then
    alias gpt='sgpt'
    alias gpt4='sgpt --model gpt-4o'
    alias gsh='sgpt --shell'
    alias gpc='sgpt --code'
fi

# =============================================================================
# Autojump - Smart directory navigation
# =============================================================================
if (( $+commands[autojump] )); then
    # Load autojump initialization script
    local autojump_locations=(
        "/usr/share/autojump/autojump.zsh"
        "/usr/local/share/autojump/autojump.zsh"
        "/opt/homebrew/share/autojump/autojump.zsh"
        "/etc/profile.d/autojump.zsh"
        "$HOME/.autojump/etc/profile.d/autojump.sh"
    )
    
    for location in $autojump_locations; do
        if [[ -f "$location" ]]; then
            source "$location"
            break
        fi
    done
    
    # Additional autojump aliases
    alias jc='autojump --child'
    alias jo='autojump --open'
    alias jco='autojump --child --open'
    alias j.='autojump .'
    alias j..='j ..'
    alias j-='j -'
    alias js='autojump --stat'
    alias jd='autojump --purge'
    
    # Integration with fzf
    (( $+commands[fzf] )) && alias jf='cd "$(autojump --complete | fzf --height 40% --reverse)"'
fi

# =============================================================================
# Tar - Archive management
# =============================================================================
if (( $+commands[tar] )); then
    # Archive extraction shortcuts
    alias targz='tar xzf'
    alias tarbz2='tar xjf'
    alias tarxz='tar xf'
    
    # Archive creation shortcuts
    alias targzc='tar -czvf'
    alias tarc='tar -cvf'
    
    # Archive inspection
    alias tarls='tar tvf'
    
    # Common tar operations with better defaults
    alias tar-create='tar -czf'
    alias tar-extract='tar -xzf'
    alias tar-list='tar -tzf'
    
    # Archive with progress (if pv is available)
    if (( $+commands[pv] )); then
        alias tar-progress='tar cf - . | pv -s $(du -sb . | awk "{print $1}") | gzip > archive.tar.gz'
    fi
    
    # Extract function for various archive types
    extract() {
        if [ -f "$1" ]; then
            case "$1" in
                *.tar.bz2)   tar xjf "$1"     ;;
                *.tar.gz)    tar xzf "$1"     ;;
                *.bz2)       bunzip2 "$1"     ;;
                *.rar)       unrar e "$1"     ;;
                *.gz)        gunzip "$1"      ;;
                *.tar)       tar xf "$1"      ;;
                *.tbz2)      tar xjf "$1"     ;;
                *.tgz)       tar xzf "$1"     ;;
                *.zip)       unzip "$1"       ;;
                *.Z)         uncompress "$1"  ;;
                *.7z)        7z x "$1"        ;;
                *)           echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
    }
fi

# =============================================================================
# Directory Navigation
# =============================================================================
# Create directory and change into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# =============================================================================
# Enhanced Search Functions
# =============================================================================
# Interactive ripgrep search
rg-search() {
    # Validate prerequisites
    command -v rg >/dev/null 2>&1 || {
        echo "rg not installed" >&2
        return 1
    }
    
    # Interactive search with common options
    local pattern="${1:-}"
    if [[ -z "$pattern" ]]; then
        echo "Usage: rg-search <pattern> [path]"
        echo "  -i  Case insensitive"
        echo "  -w  Word boundaries"
        echo "  -A  Show lines after match"
        return 1
    fi
    
    local path="${2:-.}"
    rg --color=always --line-number --heading "$pattern" "$path"
}

# =============================================================================
# Cleanup Functions
# =============================================================================
# Common reference tool
alias cht='cht.sh'

# Project cleanup functions
noeclipse() {
    find . -name '*.settings' -o -name '*.classpath' -o -name '*.factorypath' -o -name '*.project' | xargs rm -rf
}


nomac() {
    find . -name '.DS_Store' -delete
}

nopyc() {
    find . -name '*.pyc' -delete && find . -name '__pycache__' -type d -exec rm -rf {} +
}