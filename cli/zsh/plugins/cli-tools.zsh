#!/usr/bin/env zsh
# Modern CLI Tools

# Bat - Better cat
if (( $+commands[bat] )); then
    alias cat='bat'
    alias less='bat --paging=always'
    alias b='bat'
    alias bp='bat --plain'
    alias bl='bat --line-range'
fi

# Eza - Modern ls
alias l='ls'

if (( $+commands[eza] )); then
    alias ls='eza --colour=always'
    alias ll='eza -l'
    alias la='eza -la'
    alias lr='eza -R'
    alias l.='eza -d .*'
    alias lsnew='eza --sort=modified --reverse'
    alias lsold='eza --sort=modified'
    alias lsbig='eza --sort=size --reverse'
    alias lst='eza --tree'
    alias lst2='eza --tree --level=2'
    alias lst3='eza --tree --level=3'
    alias lsg='eza --git'
    alias lsga='eza -la --git'
fi

# Fd - Better find
if (( $+commands[fd] )); then
    alias ff='fd'
    alias fh='fd --hidden'
    alias fd1='fd --max-depth 1'
    alias fd2='fd --max-depth 2'
    alias fd3='fd --max-depth 3'
    alias fdf='fd --type f'
    alias fdd='fd --type d'
    alias fde='fd --extension'
    alias fdi='fd --ignore-case'
fi

# Ripgrep - Better grep
if (( $+commands[rg] )); then
    alias grep='rg --color=auto --ignore-case'
    alias lgrep='rg'
    alias sgrep='rg --context=5'
    alias rgf='rg --files'
    alias rgi='rg -i'
    alias rgw='rg -w'
    alias rgc='rg --count'
    alias rgl='rg --files-with-matches'
fi

# Dust - Better du
if (( $+commands[dust] )); then
    alias du='dust'
    alias du1='dust -d 1'
    alias dust1='dust -d 1'
    alias dust2='dust -d 2'
    alias dust3='dust -d 3'
fi

# Tree
if (( $+commands[tree] )); then
    alias t1='tree -L 1'
    alias t2='tree -L 2'
    alias t3='tree -L 3'
    alias t4='tree -L 4'
    alias t5='tree -L 5'
    alias treed='tree -d'
    alias treef='tree -f'
    alias treea='tree -a'
fi

# Zoxide - Smart navigation
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
    alias j='z'
    alias zi='zi'
    alias zd='zoxide remove'
    (( $+commands[fzf] )) && alias zf='z $(zoxide query -l | fzf --height 40% --reverse)'
fi

# Archive Management
if (( $+commands[tar] )); then
    alias targz='tar xzf'
    alias tarbz2='tar xjf'
    alias tarxz='tar xf'
    alias targzc='tar -czvf'
    alias tarc='tar -cvf'
    alias tarls='tar tvf'

    extract() {
        if [[ -f "$1" ]]; then
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

# Directory Navigation
mkcd() {
    mkdir -p "$1" && cd "$1"
}
alias mdcd='mkcd'

# Project Cleanup
alias cht='cht.sh'

nomac() {
    find . -name '.DS_Store' -delete
}

nopyc() {
    find . -name '*.pyc' -delete && find . -name '__pycache__' -type d -exec rm -rf {} +
}

noeclipse() {
    find . -name '*.settings' -o -name '*.classpath' -o -name '*.factorypath' -o -name '*.project' | xargs rm -rf
}

# Enhanced Search
rg-search() {
    command -v rg >/dev/null 2>&1 || { echo "rg not installed" >&2; return 1; }
    local pattern="${1:-}"
    [[ -z "$pattern" ]] && { echo "Usage: rg-search <pattern> [path]"; return 1; }
    local path="${2:-.}"
    rg --color=always --line-number --heading "$pattern" "$path"
}
