#!/usr/bin/env zsh
# Useful shell functions

# Set environment variable (csh compatibility)
setenv() {
    typeset -x "${1}${1:+=}${(@)argv[2,$#]}"
}

# Reload a function
freload() {
    while (( $# )); do
        unfunction $1
        autoload -U $1
        shift
    done
}

# Create a symlink from dotfiles
dot() {
    ln -sf $DOTDIR/$@ $(pwd)
}

# Export man page to different format
man_exp() {
    =man -T$2 $1 > $1.$2
}

# Copy files between docker containers
cp_docker() {
    docker run --rm -v "$1":/from -v "$2":/to alpine ash -c "cd /from ; cp -av . /to"
}

# Use colored diff if available
if command diff --color /dev/null{,} &>/dev/null; then
    function diff {
        command diff --color "$@"
    }
fi

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive types
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

# Find process by name
psgrep() {
    if [ -n "$1" ]; then
        ps aux | grep -v grep | grep -i "$1"
    else
        echo "Usage: psgrep <process_name>"
    fi
}

# Backup a file with timestamp
backup() {
    if [ -f "$1" ]; then
        cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
        echo "Backup created: $1.backup-$(date +%Y%m%d-%H%M%S)"
    else
        echo "File not found: $1"
    fi
}

# Show directory sizes sorted by size
dsize() {
    du -h --max-depth=1 "${1:-.}" | sort -h
}

# Quick web server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Show most used commands from history
histtop() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n "${1:-10}"
}

# Create a data URL from a file
dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Get current IP addresses
myip() {
    echo "Local IP addresses:"
    ip addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1'
    echo -e "\nPublic IP address:"
    curl -s ifconfig.me
    echo
}

# Weather in terminal
weather() {
    local location="${1:-}"
    curl -s "wttr.in/${location}?format=3"
}

# Calculator
calc() {
    echo "$*" | bc -l
}

# Check if command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Color man pages
man() {
    env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;36m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[1;32m' \
        man "$@"
}