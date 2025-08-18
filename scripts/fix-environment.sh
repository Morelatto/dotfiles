#!/usr/bin/env bash
# Fix environment by removing FNM conflicts and activating mise

echo "🔧 Fixing environment conflicts..."

# Remove FNM environment variables
unset FNM_MULTISHELL_PATH
unset FNM_VERSION_FILE_STRATEGY  
unset FNM_DIR
unset FNM_LOGLEVEL
unset FNM_NODE_DIST_MIRROR
unset FNM_ARCH

# Remove FNM and pyenv paths from PATH
export PATH=$(echo $PATH | tr ':' '\n' | grep -v -E '(fnm|pyenv)' | tr '\n' ':' | sed 's/:$//')

# Activate mise
eval "$(mise activate zsh)"

echo "✅ Environment fixed!"
echo "📍 Tools now point to:"
echo "   Node.js: $(which node)"
echo "   Go: $(which go)"  
echo "   Bat: $(which bat)"