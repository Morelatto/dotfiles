#!/usr/bin/env zsh
# Core Utilities - Fundamental UNIX toolkit

# =============================================================================
# Single Letter Shortcuts - Core System Tools
# =============================================================================
alias a='alias'
alias m='man'
alias q='exit'
alias s='sudo'

# =============================================================================
# Directory Navigation
# =============================================================================
alias .='cd ./'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Common directories shortcuts
alias cdd='cd ~/Downloads'
alias cdc='cd ~/Documents'
alias cdp='cd ~/Pictures'

# =============================================================================
# File Operations
# =============================================================================
alias cp='cp -Ri'    # Recursive and interactive
alias md='mkdir'

# Modern diff with color support
if diff --color /dev/null{,} &>/dev/null 2>&1; then
    alias diff='diff --color'
fi

# =============================================================================
# Listing Files
# =============================================================================
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -p'
alias mv='mv -i'     # Interactive by default
alias rm='rm -i'     # Interactive by default
alias rf='readlink -f'
alias rmrf='rm -rf'  # Force removal shortcut

# =============================================================================
# Permissions
# =============================================================================
alias chx='chmod +x'
alias 755='chmod 755'
alias 644='chmod 644'

# =============================================================================
# System Utilities
# =============================================================================
alias tf='tail -F'
alias all='alias'
alias zshd='zsh -xv &>> (tee ~/zsh-debug.log 2>/dev/null)'

# Mount operations
alias mount='sudo mount'
alias umount='sudo umount'

# =============================================================================
# Path Utilities
# =============================================================================
path() {
    echo $PATH | tr -s ":" "\n"
}

fpath() {
    echo $FPATH | tr -s ":" "\n"
}

# =============================================================================
# Directory Navigation Functions
# =============================================================================
mkcd() {
    mkdir -p "$1" && cd "$1"
}
alias mdcd='mkcd'

# =============================================================================
# Modern CLI Replacements - Rust-powered tools override traditional commands
# =============================================================================

# Bat - Better cat
if (( $+commands[bat] )); then
    alias cat='bat'
    alias less='bat --paging=always'
    alias b='bat'
    alias bp='bat --plain'
    alias bl='bat --line-range'
fi

# Eza - Modern ls (overrides basic ls aliases above)
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
    alias fds='fd --size'
    alias fdx='fd --exec'
    alias fdE='fd --exclude'
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
    alias rgh='rg --hidden'
    alias rgn='rg --no-ignore'
    alias rgt='rg --type'
    alias rgT='rg --type-not'

    # Enhanced search function
    rg-search() {
        command -v rg >/dev/null 2>&1 || { echo "rg not installed" >&2; return 1; }
        local pattern="${1:-}"
        [[ -z "$pattern" ]] && { echo "Usage: rg-search <pattern> [path]"; return 1; }
        local path="${2:-.}"
        rg --color=always --line-number --heading "$pattern" "$path"
    }
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

# Zoxide - Smart navigation (aliases only, init is in 20-plugins.zsh)
if (( $+commands[zoxide] )); then
    alias j='z'
    alias zi='zi'
    alias zd='zoxide remove'
    (( $+commands[fzf] )) && alias zf='z $(zoxide query -l | fzf --height 40% --reverse)'
fi

# =============================================================================
# Clipboard Operations
# =============================================================================
if (( $+commands[xsel] )); then
    alias copy='xsel -ib'
    alias paste='xsel -o'
    alias copyclip='xsel -ib'
    alias pasteclip='xsel -ob'
elif (( $+commands[xclip] )); then
    alias copy='xclip -selection clipboard'
    alias paste='xclip -selection clipboard -o'
    alias copyclip='xclip -selection clipboard'
    alias pasteclip='xclip -selection clipboard -o'
elif (( $+commands[wl-copy] )); then
    # Wayland clipboard support
    alias copy='wl-copy'
    alias paste='wl-paste'
fi
