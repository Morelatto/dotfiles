#!/usr/bin/env zsh
# Development Tools - Consolidated configuration for smaller dev tools

# =============================================================================
# Git - Version Control
# =============================================================================
if (( $+commands[git] )); then
    # Core git aliases - only the essentials
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

    # Branch management
    alias gb='git branch'
    alias gbd='git branch -d'
    alias gbD='git branch -D'

    # Common workflows
    alias gcp='git cherry-pick'
    alias grb='git rebase'
    alias grbi='git rebase -i'
    alias grh='git reset HEAD'
    alias grhh='git reset HEAD --hard'

    # Use delta for diffs if available
    if (( $+commands[delta] )); then
        export GIT_PAGER="delta"
    fi

    # Only set editor if not already set
    export GIT_EDITOR="${GIT_EDITOR:-${EDITOR:-nvim}}"
    
    # Git utility functions
    gitclean() {
        git rev-parse --git-dir >/dev/null 2>&1 || { echo "Not in a git repository" >&2; return 1; }
        
        local current=$(git rev-parse --abbrev-ref HEAD)
        local branches=($(git branch | grep -v "^*" | sed 's/^ *//' | grep -v "^$current$"))
        
        [[ ${#branches[@]} -eq 0 ]] && { echo "No branches to delete"; return 0; }
        
        for branch in "${branches[@]}"; do
            echo -n "Delete branch '$branch'? (y/N): "
            read -r answer
            if [[ "$answer" =~ ^[Yy]$ ]]; then
                git branch -d "$branch" 2>/dev/null || {
                    echo -n "Force delete '$branch'? (y/N): "
                    read -r force
                    [[ "$force" =~ ^[Yy]$ ]] && git branch -D "$branch"
                }
            fi
        done
    }
    
    gitquick() {
        git rev-parse --git-dir >/dev/null 2>&1 || { echo "Not in a git repository" >&2; return 1; }
        
        local message="$*"
        if [[ -z "$message" ]]; then
            local changes=$(git diff --cached --numstat | wc -l)
            local files=$(git diff --cached --name-only | wc -l)
            message="Update $files files with $changes changes"
        fi
        
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

# =============================================================================
# Development Server
# =============================================================================
# Quick Python web server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# =============================================================================
# NPM - Node Package Manager
# =============================================================================
if (( $+commands[npm] )); then
    # Core npm aliases
    alias n='npm'
    alias ni='npm install'
    alias nid='npm install --save-dev'
    alias nig='npm install -g'
    alias nu='npm uninstall'
    alias nug='npm uninstall -g'
    alias nup='npm update'
    alias nupg='npm update -g'
    
    # Script execution
    alias nr='npm run'
    alias ns='npm start'
    alias nt='npm test'
    alias nb='npm run build'
    alias nd='npm run dev'
    alias nw='npm run watch'
    
    # Package management
    alias nl='npm list'
    alias nlg='npm list -g --depth=0'
    alias nout='npm outdated'
    alias noutg='npm outdated -g'
    alias naudit='npm audit'
    alias nauditf='npm audit fix'
    
    # Publishing
    alias npub='npm publish'
    alias nv='npm version'
    alias nlink='npm link'
    
    # Info and search
    alias ninfo='npm info'
    alias nsearch='npm search'
    alias nwho='npm whoami'
    
    # Cache and cleanup
    alias ncache='npm cache'
    alias nclean='npm cache clean --force'
    alias nprune='npm prune'
    
    # Common patterns
    alias nfresh='rm -rf node_modules package-lock.json && npm install'
    alias nuke='rm -rf node_modules'
fi

# =============================================================================
# Java Development
# =============================================================================
if (( $+commands[java] )); then
    # JDK/JVM utilities
    alias jv='java -version'
    alias jc='javac'
    alias jr='java'
    alias jjar='jar'
    
    # Maven (if available)
    if (( $+commands[mvn] )); then
        alias m='mvn'
        alias mci='mvn clean install'
        alias mcp='mvn clean package'
        alias mc='mvn clean'
        alias mco='mvn compile'
        alias mt='mvn test'
        alias mdep='mvn dependency:tree'
    fi
    
    # Gradle (if available)
    if (( $+commands[gradle] )); then
        alias gr='gradle'
        alias grb='gradle build'
        alias grc='gradle clean'
        alias grt='gradle test'
        alias grr='gradle run'
    fi
fi

# =============================================================================
# UV - Modern Python Package Manager
# =============================================================================
if (( $+commands[uv] )); then
    # Core uv commands
    alias uvs='uv sync'
    alias uvsd='uv sync --dev'
    alias uva='uv add'
    alias uvad='uv add --dev'
    alias uvr='uv remove'
    alias uvl='uv lock'
    alias uvrun='uv run'
    alias uvtree='uv tree'
    
    # Virtual environment
    alias uvvenv='uv venv'
    alias uvact='source .venv/bin/activate'
    
    # Pip compatibility
    alias uvpip='uv pip'
    alias uvpi='uv pip install'
    alias uvpie='uv pip install -e .'
    alias uvpu='uv pip uninstall'
    alias uvpf='uv pip freeze'
    alias uvpl='uv pip list'
    alias uvps='uv pip show'
    
    # Tool management
    alias uvtool='uv tool'
    alias uvtooli='uv tool install'
    alias uvtoolr='uv tool run'
    alias uvtoolu='uv tool update'
    alias uvtooll='uv tool list'
    
    # Python version management
    alias uvpy='uv python'
    alias uvpyl='uv python list'
    alias uvpyi='uv python install'
fi

# =============================================================================
# Task - Task runner
# =============================================================================
if (( $+commands[task] )); then
    alias t='task'
    alias tl='task --list'
    alias ta='task --list-all'
    alias ts='task --summary'
fi

# =============================================================================
# Neovim/Vim
# =============================================================================
if (( $+commands[nvim] )); then
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    alias nv='nvim'
    
    # Quick edit common files
    alias vz='nvim ~/.config/zsh/.zshrc'
    alias vze='nvim ~/.config/zsh/.zshenv'
    alias vzp='nvim ~/.config/zsh/.zprofile'
    alias vg='nvim ~/.config/git/config'
    alias vv='nvim ~/.config/nvim/init.lua'
    alias vs='nvim ~/.config/starship.toml'
    
    # Neovim specific
    alias nvd='nvim --noplugin'
    alias nvdiff='nvim -d'
    alias nvr='nvim -R'
elif (( $+commands[vim] )); then
    alias vi='vim'
    alias v='vim'
fi

# =============================================================================
# Claude Code CLI
# =============================================================================
if (( $+commands[claude] )); then
    # Model versions (easy to update)
    export CLAUDE_SONNET="claude-sonnet-4-20250514"
    export CLAUDE_OPUS="claude-opus-4-20250514"
    
    # Basic shortcuts
    alias cl='claude'
    alias clr='claude --resume'
    alias cln='claude --new'
    
    # Model-specific shortcuts (without dangerous flags by default)
    alias cls="claude --model $CLAUDE_SONNET"
    alias clo="claude --model $CLAUDE_OPUS"
    
    # Dangerous mode (only when needed)
    alias cld='claude --dangerously-skip-permissions'
    alias clsd="cld --model $CLAUDE_SONNET"
    alias clod="cld --model $CLAUDE_OPUS"
    
    # Improved functions
    clhere() {
        local query="${*:-What files are here and what does this project do?}"
        claude "I'm in $(pwd). $query"
    }
    
    clpipe() {
        # Streams input directly without loading into memory
        cat | claude "$@"
    }
    
    clfile() {
        [[ ! -f "$1" ]] && { echo "File not found: $1" >&2; return 1; }
        
        local file="$1"
        shift
        
        # Better to let Claude read the file if it supports it
        claude "Analyze this file: $file" "$@"
    }
    
    # Flexible prompt function
    clprompt() {
        local type="$1"
        shift
        
        local -A prompts=(
            [code]="Help me with this code:"
            [fix]="Fix this error:"
            [explain]="Explain this:"
            [review]="Review this code:"
            [optimize]="Optimize this:"
        )
        
        local prompt="${prompts[$type]:-$type}"
        claude "$prompt" "$@"
    }
fi

# =============================================================================
# Marp - Markdown Presentation Tool
# =============================================================================
if (( $+commands[marp] )); then
    # Basic marp aliases
    alias mp='marp'
    alias mpw='marp --watch'
    alias mps='marp --server'
    alias mpp='marp --pdf'
    alias mph='marp --html'
    alias mppng='marp --images png'
    alias mpjpg='marp --images jpeg'
    
    # Convert and open presentation
    marpopen() {
        local input="${1:-presentation.md}"
        local output="${input%.md}.html"
        
        marp "$input" -o "$output" && xdg-open "$output"
    }
    
    # Export to multiple formats
    marpexport() {
        local input="${1:-presentation.md}"
        local base="${input%.md}"
        
        echo "Exporting $input to multiple formats..."
        marp "$input" -o "${base}.html"
        marp "$input" -o "${base}.pdf"
        marp "$input" -o "${base}.pptx"
        echo "Exported: ${base}.{html,pdf,pptx}"
    }
fi

# =============================================================================
# Mermaid CLI - Diagram Generation
# =============================================================================
if (( $+commands[mmdc] )); then
    # Basic mermaid aliases
    alias mmd='mmdc'
    alias mmdp='mmdc -o - -i'  # Output to stdout
    alias mmdpng='mmdc -o diagram.png -i'
    alias mmdsvg='mmdc -o diagram.svg -i'
    alias mmdpdf='mmdc -o diagram.pdf -i'
    
    # Quick render and open
    mmdopen() {
        local input="${1:-diagram.mmd}"
        local output="${input%.mmd}.svg"
        
        mmdc -i "$input" -o "$output" && xdg-open "$output"
    }
    
    # Batch convert all mermaid files
    mmdbatch() {
        local format="${1:-svg}"
        
        for file in *.mmd *.mermaid; do
            [[ -f "$file" ]] || continue
            local output="${file%.*}.${format}"
            echo "Converting $file to $output"
            mmdc -i "$file" -o "$output"
        done
    }
fi

# =============================================================================
# Bun - All-in-one JavaScript runtime & toolkit
# =============================================================================
if (( $+commands[bun] )); then
    # Bun is a drop-in replacement for Node.js with:
    # - 4x faster npm install
    # - Built-in TypeScript/JSX support
    # - Native bundler and test runner
    # - Package manager with workspaces support
    
    alias b='bun'
    alias bi='bun install'
    alias ba='bun add'
    alias bad='bun add -d'
    alias brm='bun remove'
    alias brun='bun run'
    alias bx='bunx'  # Like npx but faster
    alias bt='bun test'
    alias bup='bun update'  # Updates all dependencies
    
    # Bun-specific features
    alias bbuild='bun build'
    alias blink='bun link'
    alias binit='bun init'
    
    # Quick scripts
    alias bdev='bun run dev'
    alias bstart='bun run start'
    alias bbuild='bun run build'
    
    # Bun package management advantages
    bdeps() {
        if [[ ! -f "package.json" ]]; then
            echo "No package.json found"
            return 1
        fi
        
        echo "⚡ Bun Dependency Status"
        echo "======================="
        
        # Bun outdated shows all outdated deps with current/wanted/latest
        bun outdated
        
        echo -e "\n💡 Bun advantages:"
        echo "  • 'bun update' - updates ALL dependencies to latest"
        echo "  • 'bun install' - 4x faster than npm install"
        echo "  • 'bunx' - faster npx alternative, no install needed"
        echo "  • Built-in TypeScript - no config needed"
    }
    
    # Smart package manager selection based on lock files
    smart_install() {
        if [[ -f "bun.lockb" ]]; then
            echo "📦 Using bun (bun.lockb found)..."
            bun install
        elif [[ -f "package-lock.json" ]]; then
            echo "📦 Using npm (package-lock.json found)..."
            npm ci
        elif [[ -f "yarn.lock" ]]; then
            echo "📦 Using yarn (yarn.lock found)..."
            yarn install --frozen-lockfile
        elif [[ -f "pnpm-lock.yaml" ]]; then
            echo "📦 Using pnpm (pnpm-lock.yaml found)..."
            pnpm install --frozen-lockfile
        elif [[ -f "package.json" ]]; then
            echo "📦 No lock file found, using bun for speed..."
            bun install
        else
            echo "❌ No package.json found"
            return 1
        fi
    }
    
    alias si='smart_install'
    
    # Convert project to use Bun
    use_bun() {
        if [[ ! -f "package.json" ]]; then
            echo "No package.json found"
            return 1
        fi
        
        echo "🔄 Converting to Bun..."
        
        # Remove other lock files
        rm -f package-lock.json yarn.lock pnpm-lock.yaml
        
        # Install with Bun to generate bun.lockb
        bun install
        
        echo "✅ Project now uses Bun!"
        echo "   Lock file: bun.lockb"
        echo "   Run scripts with: bun run <script>"
        echo "   Execute files with: bun <file.ts/js>"
    }
fi

# =============================================================================
# Modern NPM Dependency Management (npm v7+)
# =============================================================================
if (( $+commands[npm] )); then
    # Quick dependency status using native npm
    ndeps() {
        if [[ ! -f "package.json" ]]; then
            echo "No package.json found"
            return 1
        fi
        
        # Prefer bun if available
        if (( $+commands[bun] )); then
            bdeps
            return
        fi
        
        echo "📦 Dependency Status"
        echo "==================="
        
        # Check for outdated packages
        local outdated=$(npm outdated --json 2>/dev/null)
        if [[ -n "$outdated" && "$outdated" != "{}" ]]; then
            echo "⚠️  Outdated packages found:"
            npm outdated
        else
            echo "✅ All packages up to date"
        fi
        
        echo -e "\n🔒 Security Audit"
        echo "================"
        npm audit --audit-level=moderate
        
        echo -e "\n💡 Tips:"
        echo "  • 'npm update' - update to latest semver-compatible versions"
        echo "  • 'npm audit fix' - auto-fix security issues"
        echo "  • 'npx npm-check-updates -i' - interactive major updates"
    }
    
    # Interactive update
    nupdate() {
        if [[ ! -f "package.json" ]]; then
            echo "No package.json found"
            return 1
        fi
        
        # Use bun if available (simpler and faster)
        if (( $+commands[bun] )); then
            echo "⚡ Using Bun for updates (faster)..."
            bun update
        else
            echo "🔍 Checking for all updates (including major versions)..."
            npx npm-check-updates -i
        fi
    }
fi

# =============================================================================
# Repomix - Repository Documentation Generator
# =============================================================================
if (( $+commands[repomix] )); then
    alias repo='repomix'
    alias repoi='repomix init'  # Initialize config
    alias repoc='repomix create'  # Create output
    
    # Generate repository documentation
    repodoc() {
        local output="${1:-repository-docs.md}"
        local config="${2:-.repomixrc}"
        
        if [[ ! -f "$config" ]]; then
            echo "Creating default .repomixrc..."
            cat > "$config" << 'EOF'
{
  "output": {
    "filePath": "repository-docs.md",
    "style": "markdown",
    "includeTree": true,
    "includeStats": true
  },
  "include": [
    "**/*.js",
    "**/*.ts",
    "**/*.jsx",
    "**/*.tsx",
    "**/*.py",
    "**/*.md",
    "!node_modules/**",
    "!dist/**",
    "!build/**"
  ]
}
EOF
        fi
        
        repomix create -o "$output"
        echo "Generated $output"
    }
    
    # Quick repository summary
    reposum() {
        repomix create --style plain --include-tree --include-stats -o -
    }
fi

# =============================================================================
# Serve - Static File Server
# =============================================================================
if (( $+commands[serve] )); then
    # Override the basic Python serve function if npm serve is available
    alias srv='serve'
    alias srvp='serve -p'  # Specify port
    alias srvs='serve -s'  # Single page application mode
    alias srvc='serve -C'  # Disable compression
    alias srvl='serve -l'  # Listen address
    alias srvn='serve -n'  # No clipboard
    
    # Serve with specific settings
    serveweb() {
        local dir="${1:-.}"
        local port="${2:-3000}"
        
        serve "$dir" -p "$port" --cors
    }
    
    # Serve build directory
    servebuild() {
        local dirs=("dist" "build" "out" "public")
        
        for dir in "${dirs[@]}"; do
            if [[ -d "$dir" ]]; then
                echo "Serving $dir on port 3000..."
                serve "$dir" -s -p 3000
                return
            fi
        done
        
        echo "No build directory found. Serving current directory..."
        serve . -p 3000
    }
    
    # Serve with SSL (requires certificates)
    servessl() {
        local dir="${1:-.}"
        local port="${2:-3443}"
        local cert="${3:-localhost.pem}"
        local key="${4:-localhost-key.pem}"
        
        if [[ -f "$cert" && -f "$key" ]]; then
            serve "$dir" -p "$port" --ssl-cert "$cert" --ssl-key "$key"
        else
            echo "SSL certificates not found. Run: mkcert localhost"
            return 1
        fi
    }
fi
