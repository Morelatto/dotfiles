#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-https://github.com/yourusername/dotfiles.git}"
DIR="$HOME/Public/dotfiles"

[[ -f /etc/arch-release ]] || { echo "Arch required"; exit 1; }

command -v ansible &>/dev/null || sudo pacman -Sy --needed --noconfirm ansible

[[ -d "$DIR" ]] && (cd "$DIR" && git pull) || git clone "$REPO" "$DIR"

cd "$DIR" && ansible-playbook .setup/ansible.yml -K

echo "✅ Done! Run: exec zsh"