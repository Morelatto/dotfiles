#!/usr/bin/env zsh
# Git aliases for common operations

# Basic operations
alias ga='git add'
alias ga.='git add .'
alias gaa='git add --all'
alias gap='git add -p'
alias gua='git restore --staged'

# Branch operations
alias gb='git branch'
alias gbl='git branch --list'
alias gba='git branch -a'
alias gbd='git branch -d'

# Commit operations
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'

# Clone and checkout
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcb='git checkout -B'

# Diff operations
alias gd='git diff --color-words'
alias gd.='git diff .'
alias gdc='git diff --cached'

# Reset operations
alias gss='git reset --soft'
alias gshr='git reset --hard && echo "Are you sure? [y/N]" && read -r ans && if [[ $ans != y ]]; then exit 1; fi'

# Remote operations
alias gf='git fetch --all --prune'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplm='git pull --no-rebase'
alias gp='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gpf='git push --force-with-lease'

# Log operations
alias gl='git log --stat'
alias glg='git log --oneline --decorate --all --graph'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gls='git log --stat'
alias glod='git log --oneline --decorate --graph --date-order'

# Merge operations
alias gm='git merge --no-ff'
alias gmo='git merge --strategy=ours'
alias gmt='git merge --strategy=theirs'

# Rebase operations
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grbm='git rebase main'

# Status operations
alias gs='git status -sb'
alias gs.='git status .'

# Submodule operations
alias gsb='git submodule'
alias gsl='git submodule status'
alias gsu='git submodule update --init --recursive'
alias gsba='git submodule add'

# Stash operations
alias gst='git stash push -m "WIP: $(date +%Y-%m-%d_%H-%M-%S)"'
alias gut='git stash pop'
alias gsta='git stash apply'
alias gsts='git stash save'
alias gstl='git stash list'

# Remove operations
alias grm='git rm'
alias grmc='git rm --cached'

# Authors - see who contributed to the codebase
alias authors="git ls-files | while read f; do git blame -w -M -C -C --line-porcelain \$f | grep -I '^author '; done 2>/dev/null | sort -f | uniq -ic | sort -n"