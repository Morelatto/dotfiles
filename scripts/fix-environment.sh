#!/usr/bin/env zsh
# Fix environment by removing FNM conflicts and activating mise

echo "🔧 Fixing environment conflicts..."

# Remove FNM environment variables
unset FNM_MULTISHELL_PATH
unset FNM_VERSION_FILE_STRATEGY  
unset FNM_DIR
unset FNM_LOGLEVEL
unset FNM_NODE_DIST_MIRROR
unset FNM_ARCH

# Remove FNM and pyenv paths from PATH using zsh-compatible filtering
local clean_paths=()
local IFS=':'
for path in ${(s/:/)PATH}; do
    if [[ $path != *fnm* && $path != *pyenv* ]]; then
        clean_paths+=($path)
    fi
done
export PATH="${(j/:/)clean_paths}"

# Add basic system paths to ensure mise command is available
export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

# Activate mise if available
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
    echo "✅ Environment fixed!"
    echo "📍 Tools now point to:"
    echo "   Node.js: $(command -v node 2>/dev/null || echo 'not found')"
    echo "   Go: $(command -v go 2>/dev/null || echo 'not found')"  
    echo "   Bat: $(command -v bat 2>/dev/null || echo 'not found')"
else
    echo "❌ mise command not found in PATH"
    echo "Current PATH: $PATH"
fi