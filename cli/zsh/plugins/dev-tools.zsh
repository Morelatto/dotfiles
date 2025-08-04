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
# Simon Willison's LLM CLI Tool
# =============================================================================
if (( $+commands[llm] )); then
    # Core aliases
    alias ll='llm'
    alias llp='llm prompt'
    alias llm4='llm -m 4o'           # GPT-4o
    alias llm4m='llm -m 4o-mini'     # GPT-4o mini
    alias llm35='llm -m 3.5'         # GPT-3.5 turbo
    alias llmc='llm chat'             # Interactive chat mode
    alias llml='llm logs'             # View conversation logs
    alias llmls='llm logs list'       # List all conversations
    
    # Model management
    alias llmodels='llm models list'
    alias llmdefault='llm models default'
    alias llmset='llm models set'
    
    # Plugin management
    alias llplugins='llm plugins list'
    alias llinstall='llm install'
    alias lluninstall='llm uninstall'
    
    # Key management
    alias llkeys='llm keys'
    alias llkeyset='llm keys set'
    
    # Template management
    alias lltemplates='llm templates list'
    alias lltedit='llm templates edit'
    alias lltshow='llm templates show'
    
    # Quick prompts with common options
    llmq() {
        # Quick prompt with GPT-4o-mini (fast & cheap)
        llm -m 4o-mini "$@"
    }
    
    llmcode() {
        # Code-focused prompt with system message
        llm -s "You are an expert programmer. Provide concise, practical code solutions." "$@"
    }
    
    llmexplain() {
        # Explain code or concepts
        llm -s "Explain this clearly and concisely, using examples where helpful:" "$@"
    }
    
    # File and stdin operations
    llmfile() {
        # Process a file with LLM
        local file="$1"
        shift
        if [[ -f "$file" ]]; then
            cat "$file" | llm "$@"
        else
            echo "File not found: $file"
            return 1
        fi
    }
    
    llmimg() {
        # Describe an image (requires vision model)
        local image="$1"
        shift
        llm "Describe this image" -a "$image" "$@"
    }
    
    llmweb() {
        # Summarize a webpage
        local url="$1"
        shift
        llm "Summarize this webpage" -a "$url" "$@"
    }
    
    # Git integration
    llmcommit() {
        # Generate commit message from git diff
        git diff --staged | llm -t commit 2>/dev/null || \
        git diff --staged | llm "Write a concise git commit message for these changes. Use conventional commit format (feat:, fix:, docs:, etc)"
    }
    
    llmpr() {
        # Generate PR description
        local base="${1:-main}"
        git diff "$base"...HEAD | llm "Write a pull request description for these changes. Include a summary, key changes, and testing notes."
    }
    
    # Documentation generation
    llmdoc() {
        # Generate documentation for a function/file
        local file="$1"
        if [[ -f "$file" ]]; then
            cat "$file" | llm "Generate comprehensive documentation for this code. Include purpose, parameters, return values, and usage examples."
        else
            echo "File not found: $file"
            return 1
        fi
    }
    
    # System prompt templates (save commonly used)
    llmsave() {
        # Save a template
        local name="$1"
        local prompt="$2"
        if [[ -z "$name" || -z "$prompt" ]]; then
            echo "Usage: llmsave <template-name> <system-prompt>"
            return 1
        fi
        echo "$prompt" | llm templates set "$name"
    }
    
    # Embedding operations
    llmembed() {
        # Create embeddings for files
        local collection="$1"
        shift
        llm embed-multi "$collection" "$@"
    }
    
    llmsimilar() {
        # Find similar content
        local collection="$1"
        local query="$2"
        llm similar "$collection" -c "$query"
    }
    
    # RAG (Retrieval Augmented Generation)
    llmrag() {
        # Simple RAG implementation
        local collection="$1"
        local query="$2"
        shift 2
        
        # Find similar content and use it as context
        local context=$(llm similar "$collection" -c "$query" 2>/dev/null)
        if [[ -n "$context" ]]; then
            echo "$context" | llm "Based on this context, answer: $query" "$@"
        else
            llm "$query" "$@"
        fi
    }
    
    # Cost tracking with better formatting
    llmcost() {
        # Show token usage and estimated costs
        echo "📊 LLM Usage Statistics"
        echo "━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        
        # Check if database exists
        if [[ ! -f ~/.config/io.datasette.llm/logs.db ]]; then
            echo "No usage data yet"
            return 1
        fi
        
        # Token usage by model with formatted numbers
        echo "🔤 Token Usage by Model:"
        echo "─────────────────────────────────────────────────────────────"
        sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT 
                printf('%-25s', substr(model, 1, 25)) as model,
                printf('%6d calls', COUNT(*)) as calls,
                printf('%12s in', printf('%,d', COALESCE(SUM(input_tokens), 0))) as input,
                printf('%12s out', printf('%,d', COALESCE(SUM(output_tokens), 0))) as output,
                printf('%15s total', printf('%,d', COALESCE(SUM(input_tokens + output_tokens), 0))) as total
             FROM responses 
             WHERE input_tokens IS NOT NULL OR output_tokens IS NOT NULL
             GROUP BY model 
             ORDER BY SUM(input_tokens + output_tokens) DESC
             LIMIT 10;" 2>/dev/null | column -t
        
        echo ""
        echo "💰 Estimated Costs (OpenAI pricing):"
        echo "─────────────────────────────────────────────────────────────"
        
        # Calculate and display costs with better formatting
        sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT 
                printf('  %-25s', substr(model, 1, 25)) || 
                printf('$%8.2f', 
                    CASE 
                        WHEN model LIKE '%gpt-4o-mini%' THEN (SUM(input_tokens) * 0.00015 + SUM(output_tokens) * 0.0006) / 1000
                        WHEN model LIKE '%gpt-4o%' THEN (SUM(input_tokens) * 0.0025 + SUM(output_tokens) * 0.01) / 1000
                        WHEN model LIKE '%gpt-4-turbo%' OR model LIKE '%gpt-4.1%' THEN (SUM(input_tokens) * 0.01 + SUM(output_tokens) * 0.03) / 1000
                        WHEN model LIKE '%gpt-4%' THEN (SUM(input_tokens) * 0.03 + SUM(output_tokens) * 0.06) / 1000
                        WHEN model LIKE '%gpt-3.5%' THEN (SUM(input_tokens) * 0.0005 + SUM(output_tokens) * 0.0015) / 1000
                        ELSE 0
                    END
                ) as line
             FROM responses 
             WHERE input_tokens IS NOT NULL
             GROUP BY model 
             HAVING CAST(substr(line, -8) as REAL) > 0
             ORDER BY CAST(substr(line, -8) as REAL) DESC;" 2>/dev/null
        
        # Calculate total estimated cost
        local total_cost=$(sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT printf('%.2f',
                SUM(CASE 
                    WHEN model LIKE '%gpt-4o-mini%' THEN (input_tokens * 0.00015 + output_tokens * 0.0006) / 1000
                    WHEN model LIKE '%gpt-4o%' THEN (input_tokens * 0.0025 + output_tokens * 0.01) / 1000
                    WHEN model LIKE '%gpt-4-turbo%' OR model LIKE '%gpt-4.1%' THEN (input_tokens * 0.01 + output_tokens * 0.03) / 1000
                    WHEN model LIKE '%gpt-4%' THEN (input_tokens * 0.03 + output_tokens * 0.06) / 1000
                    WHEN model LIKE '%gpt-3.5%' THEN (input_tokens * 0.0005 + output_tokens * 0.0015) / 1000
                    ELSE 0
                END))
             FROM responses 
             WHERE input_tokens IS NOT NULL;" 2>/dev/null)
        
        echo "─────────────────────────────────────────────────────────────"
        echo "  TOTAL ESTIMATED COST:     \$$total_cost"
        
        echo ""
        echo "📅 Recent Activity (last 7 days):"
        echo "─────────────────────────────────────────────────────────────"
        sqlite3 -column ~/.config/io.datasette.llm/logs.db \
            "SELECT 
                printf('  %s', DATE(datetime_utc)) as date,
                printf('%5d queries', COUNT(*)) as queries,
                printf('%15s tokens', printf('%,d', COALESCE(SUM(input_tokens + output_tokens), 0))) as tokens
             FROM responses 
             WHERE datetime_utc > datetime('now', '-7 days')
             GROUP BY DATE(datetime_utc)
             ORDER BY DATE(datetime_utc) DESC
             LIMIT 7;" 2>/dev/null
        
        echo ""
        echo "💡 Tip: Use 'llmstats' for a quick summary"
    }
    
    # Simple usage summary
    llmstats() {
        # Quick stats without detailed breakdown
        if [[ ! -f ~/.config/io.datasette.llm/logs.db ]]; then
            echo "No LLM usage data yet"
            return 1
        fi
        
        local total_calls=$(sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT COUNT(*) FROM responses;" 2>/dev/null)
        
        local total_tokens=$(sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT COALESCE(SUM(input_tokens + output_tokens), 0) FROM responses;" 2>/dev/null)
        
        local models_used=$(sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT COUNT(DISTINCT model) FROM responses;" 2>/dev/null)
        
        echo "📊 LLM Quick Stats"
        echo "=================="
        echo "Total queries: $total_calls"
        echo "Total tokens: $(echo $total_tokens | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')"
        echo "Models used: $models_used"
        echo ""
        echo "Top 3 models:"
        sqlite3 ~/.config/io.datasette.llm/logs.db \
            "SELECT '  ' || model || ': ' || COUNT(*) || ' calls' 
             FROM responses 
             GROUP BY model 
             ORDER BY COUNT(*) DESC 
             LIMIT 3;" 2>/dev/null
    }
    
    # Interactive chat with context
    llmchat() {
        # Start chat with optional context file
        local context_file="$1"
        if [[ -f "$context_file" ]]; then
            cat "$context_file" | llm chat -s "Context provided. Answer based on this context when relevant."
        else
            llm chat
        fi
    }
    
    # Common workflows
    llmfix() {
        # Fix code errors
        echo "$1" | llm "Fix this error and explain what was wrong:"
    }
    
    llmtest() {
        # Generate tests for code
        local file="$1"
        if [[ -f "$file" ]]; then
            cat "$file" | llm "Generate comprehensive unit tests for this code. Use appropriate testing framework."
        fi
    }
    
    llmrefactor() {
        # Suggest refactoring
        local file="$1"
        if [[ -f "$file" ]]; then
            cat "$file" | llm "Suggest refactoring improvements for this code. Focus on readability, performance, and best practices."
        fi
    }
    
    # Plugin helpers
    llmclaude() {
        # Use Claude if plugin installed
        if llm models list | grep -q claude; then
            llm -m claude-3-5-sonnet "$@"
        else
            echo "Claude plugin not installed. Run: llm install llm-claude-3"
            return 1
        fi
    }
    
    llmlocal() {
        # Use local model if available
        if llm models list | grep -q gpt4all; then
            llm -m orca-2-7b "$@"  # Or another local model
        else
            echo "Local model plugin not installed. Run: llm install llm-gpt4all"
            return 1
        fi
    }
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
# PyCharm/JetBrains IDEs Helpers
# =============================================================================
# PyCharm shortcuts
alias pc='pycharm &'
alias pycc='rm -rf ~/.cache/JetBrains/PyCharmCE*/caches'
alias pycsize='du -sh ~/.cache/JetBrains/PyCharmCE*/'

# Clean .idea directories (IntelliJ project files)
noidea() {
    find . -type d -name '.idea' -exec rm -rf {} +
}

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

# =============================================================================
# Process Management with fzf
# =============================================================================
if (( $+commands[fzf] )); then
    # Custom kill completion using fzf
    _fzf_kill_completion() {
        setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
        local selected
        
        # Use a more comprehensive process listing that includes searchable command args
        selected=$(ps -eo pid,ppid,user,%cpu,%mem,comm,args --sort=-%cpu | 
            awk 'NR==1 {next} {
                # Format: PID PPID USER %CPU %MEM COMM ARGS...
                # Create searchable line with key info
                cmd = $7; for(i=8; i<=NF; i++) cmd = cmd " " $i
                # Dynamic program name extraction
                prog = $6  # Start with comm field
                
                # Extract meaningful name from command path
                if (cmd ~ /\/[^\/\s]+/) {
                    # Extract basename from full path in command
                    split(cmd, cmd_parts, " ")
                    for (i in cmd_parts) {
                        if (cmd_parts[i] ~ /^\/.*\/[^\/]+$/) {
                            split(cmd_parts[i], path_parts, "/")
                            basename = path_parts[length(path_parts)]
                            # Clean up common suffixes
                            gsub(/\.(py|js|sh|rb|pl|jar|exe)$/, "", basename)
                            gsub(/-bin$/, "", basename)
                            if (basename != "" && basename != prog) {
                                prog = basename
                                break
                            }
                        }
                    }
                }
                
                # Special handling for JVM applications
                if (prog == "java" && cmd ~ /-jar/) {
                    match(cmd, /-jar\s+([^\/\s]*\/)?([^\/\s]+)\.jar/, jar_match)
                    if (jar_match[2] != "") {
                        prog = jar_match[2]
                    }
                }
                
                # Special handling for Python scripts
                if ((prog == "python" || prog == "python3") && cmd ~ /\.py/) {
                    match(cmd, /([^\/\s]+)\.py/, py_match)
                    if (py_match[1] != "") {
                        prog = py_match[1]
                    }
                }
                
                # Special handling for Node.js
                if (prog == "node") {
                    if (cmd ~ /\/node_modules\/\.bin\//) {
                        match(cmd, /\/node_modules\/\.bin\/([^\/\s]+)/, node_match)
                        if (node_match[1] != "") {
                            prog = node_match[1]
                        }
                    } else if (cmd ~ /\.js/) {
                        match(cmd, /([^\/\s]+)\.js/, js_match)
                        if (js_match[1] != "") {
                            prog = js_match[1]
                        }
                    }
                }
                
                printf "%s %s %s %s %s %s %s\n", $1, $2, $3, $4, $5, prog, substr(cmd, 1, 80)
            }' | 
            fzf --multi \
                --header="Select processes to kill (TAB for multi-select, type to search)" \
                --preview 'ps -fp {1} 2>/dev/null' \
                --preview-window=down:4:wrap \
                --bind 'ctrl-r:reload(ps -eo pid,ppid,user,%cpu,%mem,comm,args --sort=-%cpu | awk "NR==1 {next} {cmd = \$7; for(i=8; i<=NF; i++) cmd = cmd \" \" \$i; prog = \$6; if (cmd ~ /\/[^\/\\s]+/) { split(cmd, cmd_parts, \" \"); for (i in cmd_parts) { if (cmd_parts[i] ~ /^\/.*\/[^\/]+\$/) { split(cmd_parts[i], path_parts, \"/\"); basename = path_parts[length(path_parts)]; gsub(/\\.(py|js|sh|rb|pl|jar|exe)\$/, \"\", basename); gsub(/-bin\$/, \"\", basename); if (basename != \"\" && basename != prog) { prog = basename; break } } } } if (prog == \"java\" && cmd ~ /-jar/) { match(cmd, /-jar\\s+([^\\/\\s]*\\/)?([^\\/\\s]+)\\.jar/, jar_match); if (jar_match[2] != \"\") { prog = jar_match[2] } } printf \"%s %s %s %s %s %s %s\\n\", \$1, \$2, \$3, \$4, \$5, prog, substr(cmd, 1, 80)}")' | 
            awk '{print $1}')
        
        if [[ -n "$selected" ]]; then
            local pids=(${(f)selected})
            compadd -a pids
        fi
    }
    
    # Register the completion function
    compdef _fzf_kill_completion kill
    
    # Also enable for killall and pkill
    compdef _fzf_kill_completion killall
    compdef _fzf_kill_completion pkill
fi

# =============================================================================
# Repomix - Repository Documentation Generator
# =============================================================================
if (( $+commands[repomix] )); then
    # Core aliases
    alias repo='repomix'
    alias repoc='repomix --compress'
    
    # Smart config detection
    _repomix_config() {
        [[ -f "repomix.config.json5" ]] && echo "repomix.config.json5" && return
        [[ -f "$HOME/.config/repomix/repomix.config.json5" ]] && echo "$HOME/.config/repomix/repomix.config.json5" && return
        return 1
    }
    
    # AI-optimized pack (main function)
    repoai() {
        local output="${1:-repomix-ai.xml}" config
        config="$(_repomix_config)"
        
        if [[ -n "$config" ]]; then
            repomix --config "$config" --output "$output" --style xml
        else
            repomix --output "$output" --style xml --compress --remove-comments --remove-empty-lines
        fi
        
        [[ -f "$output" ]] && echo "📊 Tokens: ~$(($(wc -c < "$output") / 4))"
        echo "✅ Generated $output"
    }
    
    # Quick stats
    repostats() {
        local file="${1:-repomix-ai.xml}"
        [[ ! -f "$file" ]] && { echo "File not found: $file"; return 1; }
        
        local chars=$(wc -c < "$file")
        local tokens=$((chars / 4))
        
        echo "📊 $file: $(echo $chars | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta') chars, $(echo $tokens | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta') tokens"
        echo "💰 GPT-4o: \$$(printf "%.4f" $(echo "scale=6; $tokens * 0.0025 / 1000" | bc)) | GPT-4o-mini: \$$(printf "%.4f" $(echo "scale=6; $tokens * 0.00015 / 1000" | bc))"
    }
    
    # Interactive FZF interface
    repofzf() {
        (( $+commands[fzf] )) || { echo "❌ fzf required"; return 1; }
        
        local action=$(cat <<'EOF' | fzf --height=50% --border --header="🚀 Repomix Menu"
🎯 AI Pack (XML, optimized)
📝 Standard (Markdown)
🗂️  Structure Only
📁 Select Files
🎛️  By Category
📊 Stats
🧹 Clean
EOF
)
        
        case "$action" in
            *"AI Pack"*) 
                local output=$(echo "repomix-ai.xml" | fzf --print-query --header="📝 Filename" | tail -1)
                repoai "${output:-repomix-ai.xml}"
                ;;
            *"Standard"*)
                local output=$(echo "repomix.md" | fzf --print-query --header="📝 Filename" | tail -1)
                local config="$(_repomix_config)"
                if [[ -n "$config" ]]; then
                    repomix --config "$config" --output "${output:-repomix.md}"
                else
                    repomix --output "${output:-repomix.md}" --compress
                fi
                ;;
            *"Structure"*)
                repomix --no-files --style plain > repomix-structure.txt
                echo "✅ Generated repomix-structure.txt"
                ;;
            *"Select Files"*)
                local files
                if git rev-parse --git-dir >/dev/null 2>&1; then
                    files=$(git ls-files | fzf --multi --preview 'head -10 {}' --header="Select files (TAB=multi)")
                else
                    files=$(find . -type f -not -path './.*' | fzf --multi --preview 'head -10 {}')
                fi
                [[ -n "$files" ]] && echo "$files" | repomix --stdin --compress -o repomix-selected.xml
                ;;
            *"By Category"*)
                local cat=$(cat <<'EOF' | fzf --header="🎛️ Category"
dotfiles
frontend
backend
config
docs
EOF
)
                case "$cat" in
                    dotfiles) repomix --include="**/*.{sh,zsh,toml,yml,rc}" --compress -o repomix-dotfiles.xml ;;
                    frontend) repomix --include="**/*.{js,ts,jsx,tsx,css,html}" --compress -o repomix-frontend.xml ;;
                    backend) repomix --include="**/*.{py,go,rs,java}" --compress -o repomix-backend.xml ;;
                    config) repomix --include="**/*.{yml,yaml,toml,json}" --compress -o repomix-config.xml ;;
                    docs) repomix --include="**/*.md" --compress -o repomix-docs.xml ;;
                esac
                ;;
            *"Stats"*)
                local file=$(find . -name "repomix*.{xml,md,txt}" | fzf --header="📊 Analyze file")
                [[ -n "$file" ]] && repostats "$file"
                ;;
            *"Clean"*)
                local files=$(find . -name "repomix*" | fzf --multi --header="🧹 Select to delete")
                [[ -n "$files" ]] && echo "$files" | xargs rm -v
                ;;
        esac
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
