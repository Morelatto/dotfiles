#!/bin/bash
# Pre-deploy hook - Dotter runs this automatically before deployment

echo "🚀 Starting dotfiles deployment..."

# Always needed
mkdir -p ~/.local/bin
mkdir -p ~/.cache/zsh

# Package-specific directories
if grep -q '"shell"' .dotter/local.toml 2>/dev/null; then
    mkdir -p ~/.config/zsh
    mkdir -p ~/.ssh/sockets
fi

if grep -q '"dev"' .dotter/local.toml 2>/dev/null; then
    mkdir -p ~/.config/{git,nvim}
fi

if grep -q '"gui"' .dotter/local.toml 2>/dev/null; then
    mkdir -p ~/.config/{i3,picom,dunst,gtk-3.0,gtk-4.0}
fi

echo "✅ Pre-deploy setup complete!"