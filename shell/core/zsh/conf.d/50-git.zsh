#!/usr/bin/env zsh
# Git
if (( $+commands[git] )); then
    alias g='git'
    alias ga='git add'
    alias gaa='git add --all'
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gco='git checkout'
    alias gd='git diff'
    alias gdc='git diff --cached'
    alias gf='git fetch --all --prune'
    alias gl='git log --oneline --graph --decorate'
    alias gp='git push'
    alias gpl='git pull'
    alias gs='git status --short --branch'
    alias gst='git stash'
    alias gb='git branch'
    alias gbd='git branch -d'
    alias gbD='git branch -D'
    alias gcp='git cherry-pick'
    alias grb='git rebase'
    alias grh='git reset HEAD'
    alias grhh='git reset HEAD --hard'
    alias gm='git merge'
    alias grs='git reset --soft HEAD~1'
    alias grm='git rm'
    alias grc='git rm --cached'
    alias gsh='git show'
    alias gtag='git tag'
    alias gpr='git pull --rebase'
    alias gca='git commit --amend'
    alias gcan='git commit --amend --no-edit'

    # Smart URL cleanup function
    _git_clean_url() {
        local url="$1"
        if [[ "$url" =~ github\.com ]]; then
            echo "$url" | sed -E 's|^https?://github\.com/([^/]+/[^/?#]+).*|\1|' | sed 's|^|https://github.com/|; s|$|.git|'
        else
            echo "$url"
        fi
    }

    # Override git command to auto-clean clone URLs
    git() {
        if [[ "$1" == "clone" && -n "$2" ]]; then
            local cleaned_url=$(_git_clean_url "$2")
            if [[ "$cleaned_url" != "$2" ]]; then
                echo "Cleaned URL: $2 → $cleaned_url"
                command git clone "$cleaned_url" "${@:3}"
            else
                command git "$@"
            fi
        else
            command git "$@"
        fi
    }

    # Smart git clone alias (for those who prefer explicit gcl)
    alias gcl='git clone'

    (( $+commands[delta] )) && export GIT_PAGER="delta"
    export GIT_EDITOR="${GIT_EDITOR:-${EDITOR:-nvim}}"

    gitquick() {
        git rev-parse --git-dir >/dev/null 2>&1 || { echo "Not in a git repository" >&2; return 1; }
        local message="$*"
        [[ -z "$message" ]] && message="Quick update"
        git add -A && git commit -m "$message"
    }

    gitroot() {
        local root=$(git rev-parse --show-toplevel 2>/dev/null)
        if [[ -n "$root" ]]; then
            cd "$root"
        else
            echo "Not in a git repository" >&2
            return 1
        fi
    }
fi
