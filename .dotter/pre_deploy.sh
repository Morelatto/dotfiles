#!/bin/bash
# Pre-deploy hook - Dotter runs this automatically before deployment

echo "🚀 Starting dotfiles deployment..."

# Always needed
mkdir -p ~/.local/bin
mkdir -p ~/.cache/zsh

# Shell package directories (terminal environment)
if grep -q '"shell"' .dotter/local.toml 2>/dev/null; then
    mkdir -p ~/.config/{zsh,git,nvim}
    mkdir -p ~/.ssh/sockets
fi

# Desktop package directories (X11/i3 environment)
if grep -q '"desktop"' .dotter/local.toml 2>/dev/null; then
    mkdir -p ~/.config/{i3,picom,dunst,gtk-3.0,gtk-4.0,rofi}
fi

echo "✅ Pre-deploy setup complete!"