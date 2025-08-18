#!/bin/bash
# Pre-deploy hook - Dotter runs this automatically before deployment

echo "🚀 Starting dotfiles deployment..."

# Create necessary directories
mkdir -p ~/.config/{zsh,git,nvim,i3,picom,dunst,gtk-3.0,gtk-4.0}
mkdir -p ~/.local/bin
mkdir -p ~/.ssh/sockets
mkdir -p ~/.cache/zsh

echo "✅ Pre-deploy setup complete!"