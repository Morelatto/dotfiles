#!/bin/bash
# Pre-deploy hook - Dotter runs this automatically before deployment

echo "🚀 Starting dotfiles deployment..."

# Create necessary directories
echo "📁 Creating required directories..."
mkdir -p ~/.config/{zsh,git,nvim,i3,picom,dunst,gtk-3.0,gtk-4.0}
mkdir -p ~/.local/bin
mkdir -p ~/.ssh/sockets
mkdir -p ~/.cache/zsh
mkdir -p ~/.local/share/man

# Check if this is first run (no zsh config exists)
if [[ ! -f ~/.zshenv && ! -f ~/.config/zsh/config/init.zsh ]]; then
    echo "📦 First run detected. Essential packages needed:"
    echo "  - zsh, zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting"
    echo "  - git, neovim, fzf, ripgrep, fd, bat, eza"
    echo "  - i3-wm, picom, dunst, rofi (for desktop)"
    echo ""
    echo "Install with: sudo pacman -S <packages>"
    echo "For AUR packages: yay -S starship-bin"
fi

echo "✅ Pre-deploy checks complete!"