#!/usr/bin/env zsh
# Development Tools

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

# NPM
if (( $+commands[npm] )); then
    alias n='npm'
    alias ni='npm install'
    alias nid='npm install --save-dev'
    alias nu='npm uninstall'
    alias nup='npm update'
    alias nr='npm run'
    alias ns='npm start'
    alias nt='npm test'
    alias nb='npm run build'
    alias nd='npm run dev'
    alias nl='npm list'
    alias nout='npm outdated'
    alias naudit='npm audit'
    alias nauditf='npm audit fix'
    alias nfresh='rm -rf node_modules package-lock.json && npm install'
    alias nuke='rm -rf node_modules'
fi

# UV - Python Package Manager
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

# Bun
if (( $+commands[bun] )); then
    alias b='bun'
    alias bi='bun install'
    alias ba='bun add'
    alias bad='bun add -d'
    alias brm='bun remove'
    alias brun='bun run'
    alias bx='bunx'
    alias bt='bun test'
    alias bup='bun update'
    alias bdev='bun run dev'
    alias bstart='bun run start'
    alias bbuild='bun run build'

    smart_install() {
        if [[ -f "bun.lockb" ]]; then
            echo "Using bun..."
            bun install
        elif [[ -f "package-lock.json" ]]; then
            echo "Using npm..."
            npm ci
        elif [[ -f "yarn.lock" ]]; then
            echo "Using yarn..."
            yarn install --frozen-lockfile
        elif [[ -f "package.json" ]]; then
            echo "No lock file, using bun..."
            bun install
        else
            echo "No package.json found"
            return 1
        fi
    }
    alias si='smart_install'
fi

# Task
if (( $+commands[go-task] )); then
    alias t='go-task'
    alias task='go-task'
    alias tl='task --list'
    alias ta='task --list-all'
fi

# Neovim/Vim
if (( $+commands[nvim] )); then
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    alias nv='nvim'
    alias vz='nvim ~/.config/zsh/.zshrc'
    alias vg='nvim ~/.config/git/config'
    alias vv='nvim ~/.config/nvim/init.lua'
    alias nvd='nvim --noplugin'
    alias nvr='nvim -R'
elif (( $+commands[vim] )); then
    alias vi='vim'
    alias v='vim'
fi

# LLM CLI Tool
if (( $+commands[llm] )); then
    alias ll='llm'
    alias llm4='llm -m 4o'
    alias llm4m='llm -m 4o-mini'
    alias llmc='llm chat'
    alias llml='llm logs'
    alias llmodels='llm models list'

    llmfile() {
        local file="$1"
        shift
        [[ -f "$file" ]] && cat "$file" | llm "$@" || echo "File not found: $file"
    }

    llmcommit() {
        git diff --staged | llm "Write a concise git commit message for these changes. Use conventional commit format (feat:, fix:, docs:, etc)"
    }
fi

# Claude Code CLI
if (( $+commands[claude] )); then
    export CLAUDE_OPUS="claude-sonnet-4-1-20250805"
    export CLAUDE_SONNET="claude-sonnet-4-20250514"

    alias claude='claude --dangerously-skip-permissions'
    alias cc='claude'
    alias clr='claude --resume'
    alias cln='claude --new'
    alias cls="claude --model $CLAUDE_SONNET"
    alias clo="claude --model $CLAUDE_OPUS"

fi

# Java Development
if (( $+commands[java] )); then
    alias jv='java -version'
    alias jc='javac'

    if (( $+commands[mvn] )); then
        alias m='mvn'
        alias mci='mvn clean install'
        alias mc='mvn clean'
        alias mt='mvn test'
    fi

    if (( $+commands[gradle] )); then
        alias gr='gradle'
        alias grb='gradle build'
        alias grc='gradle clean'
        alias grt='gradle test'
    fi
fi

# Development Server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Docker
if (( $+commands[docker] )); then
    alias d='docker'
    alias dc='docker-compose'
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias di='docker images'
    alias drm='docker rm'
    alias drmi='docker rmi'
    alias dlog='docker logs'
    alias dexec='docker exec -it'
fi

# PyCharm
if (( $+commands[pycharm] )); then
    alias pc='pycharm &'
    alias pyc='pycharm-community &'
    alias pycc='rm -rf ~/.cache/JetBrains/PyCharmCE*/caches'
    alias pycsize='du -sh ~/.cache/JetBrains/PyCharmCE*/'

    # Check PyCharm memory usage
    pymem() {
        local pycharm_processes=$(ps aux | awk '/[Pp]y[Cc]harm/ && !/awk/ {print}')

        if [[ -z "$pycharm_processes" ]]; then
            echo "PyCharm not running"
            return 1
        fi

        echo "$pycharm_processes" | awk '{
            mem_gb = $6/1024/1024
            cpu_pct = $4
            printf "PyCharm PID %s: %.1f GB RAM (%.1f%% CPU)\n", $2, mem_gb, cpu_pct
        }'
    }
fi

# Project Cleanup
noidea() {
    find . -type d -name '.idea' -exec rm -rf {} +
}

nopyc() {
    find . -name '*.pyc' -delete && find . -name '__pycache__' -type d -exec rm -rf {} +
}

nomac() {
    find . -name '.DS_Store' -delete
}

# Repomix
if (( $+commands[repomix] )); then
    alias repo='repomix'
    alias repoinit='repomix --init'
    alias rp='repomix'
    alias rpi='repomix --init'
    alias rpx='repomix --style xml --output repomix-output.xml'
    alias rpm='repomix --style markdown --output repomix-output.md'
    alias rpt='repomix --style plain --output repomix-output.txt'
    alias rpa='repoai'      # AI-optimized compression
    alias rptype='repotype' # Pack specific file types
    alias rpc='repoclip'    # Copy to clipboard
    alias rpr='reporemote'  # Pack remote repo
    alias rps='repostats'   # Show stats only
    alias rprev='reporeview' # Include git diffs
    alias rpclean='repoclean' # Clean output files
    alias rpd='repodocs'  # Alias for API docs

    repoai() {
        local output="${1:-repomix-ai.xml}"
        repomix --output "$output" --compress --remove-empty-lines
        [[ -f "$output" ]] && echo "📊 Tokens: ~$(($(wc -c < "$output") / 4))"
        echo "✅ Generated $output"
    }

    repotype() {
        local types="${1:?Usage: repotype 'py,js,ts'}"
        local output="${2:-repomix-${types//,/-}.md}"
        repomix --include "**/*.{${types}}" --output "$output" --style markdown
        echo "✅ Packed *.{${types}} files to $output"
    }

    repoclip() {
        local tmpfile="/tmp/repomix-clip-$$.md"
        repomix --output "$tmpfile" --style markdown --compress "${@}"

        if command -v pbcopy &>/dev/null; then
            pbcopy < "$tmpfile"
        elif command -v xclip &>/dev/null; then
            xclip -selection clipboard < "$tmpfile"
        elif command -v wl-copy &>/dev/null; then
            wl-copy < "$tmpfile"
        else
            echo "❌ No clipboard utility found (pbcopy/xclip/wl-copy)"
            return 1
        fi

        local size=$(du -h "$tmpfile" | cut -f1)
        rm "$tmpfile"
        echo "📋 Copied to clipboard ($size)"
    }

    reporemote() {
        local repo="${1:?Usage: reporemote 'owner/repo' [branch]}"
        local branch="${2:-main}"
        local output="repomix-${repo//\//-}-${branch}.md"

        repomix --remote "$repo" --remote-branch "$branch" --output "$output" --style markdown
        echo "✅ Packed $repo@$branch to $output"
    }

    repostats() {
        repomix --output /dev/null --no-files --style plain | head -20
    }

    reporeview() {
        local output="${1:-repomix-review-$(date +%Y%m%d).md}"
        repomix --output "$output" --style markdown --git-include-diffs
        echo "✅ Generated review file with diffs: $output"
    }

    repoclean() {
        local count=$(ls repomix*.{xml,md,txt} 2>/dev/null | wc -l)
        if [[ $count -gt 0 ]]; then
            rm -i repomix*.{xml,md,txt} 2>/dev/null
            echo "🧹 Cleaned repomix output files"
        else
            echo "✨ No repomix output files found"
        fi
    }

    repodocs() {
        local output="${1:-repomix-api-docs.md}"
        repomix --output "$output" --style markdown --compress
        echo "📚 Generated API documentation: $output"
    }
fi
