#!/usr/bin/env bash
# Cleanup script to remove system packages that conflict with mise-managed tools
# Run ONLY after confirming mise tools work correctly!

set -e

echo "🧹 Cleaning up system packages that conflict with mise tools..."
echo "⚠️  This will remove system packages in favor of mise-managed versions"
echo "⚠️  Make sure to test 'mise list' and tool functionality first!"
read -p "Continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Cancelled"
    exit 1
fi

echo "📦 Removing conflicting language runtimes..."
sudo pacman -Rs --noconfirm nodejs npm || true
sudo pacman -Rs --noconfirm python-pip python-virtualenv python-poetry || true
sudo pacman -Rs --noconfirm go rust || true

echo "🔧 Removing conflicting CLI tools..."
sudo pacman -Rs --noconfirm bat eza fd ripgrep fzf starship git-delta dust bottom || true

echo "🏗️  Removing AUR versions..."
yay -Rs --noconfirm bat-bin eza-bin fd-bin ripgrep-bin fzf-bin starship-bin || true

echo "🗑️  Removing orphaned packages..."
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || true

echo "💾 Clearing package cache..."
sudo pacman -Sc --noconfirm

echo "✅ System cleanup complete!"
echo "🔄 Restart your shell to ensure mise tools have priority in PATH"