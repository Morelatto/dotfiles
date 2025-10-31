#\!/usr/bin/env zsh
# AI Tools - LLM CLI and Claude Code

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
    alias claude="~/.claude/local/claude --dangerously-skip-permissions"
    alias cc='claude'
    alias ccr='claude --resume'
    alias ccn='claude --new'
    alias ccs="claude --model $CLAUDE_SONNET"
    alias cco="claude --model $CLAUDE_OPUS"

    if (( $+commands[claude-code-monitor] )); then
        alias ccd="claude-code-monitor"
    fi

    if (( $+commands[ccusage] )); then
        alias ccu="ccusage"
    fi

    if (( $+commands[claude-trace] )); then
        alias cct="claude-trace"
    fi
fi

# =============================================================================
# Repomix - AI-optimized codebase packaging
# =============================================================================
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

        local size=$(command du -h "$tmpfile" | cut -f1)
        rm -f "$tmpfile"
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

