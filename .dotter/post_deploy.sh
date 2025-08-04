#!/bin/bash
# Post-deploy hook - runs after Dotter deploys files

echo "🔧 Running post-deployment tasks..."

# Reload shell configuration if in interactive shell
if [[ $- == *i* ]]; then
    echo "🔄 Reloading shell configuration..."
    source ~/.zshenv 2>/dev/null || true
fi

# Create zsh history file if it doesn't exist
if [[ ! -f ~/.cache/zsh/.zhistory ]]; then
    echo "📝 Creating zsh history file..."
    touch ~/.cache/zsh/.zhistory
fi

# Set correct permissions for SSH directory
if [[ -d ~/.ssh ]]; then
    echo "🔐 Setting SSH permissions..."
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/config 2>/dev/null || true
    chmod 700 ~/.ssh/sockets 2>/dev/null || true
fi

# Reload i3 if it's running and i3 config was deployed
if pgrep -x i3 >/dev/null && [[ -f ~/.config/i3/config ]]; then
    # Check if i3 config was recently deployed (modified in last 10 seconds)
    if [[ $(find ~/.config/i3/config -mtime -10s 2>/dev/null) ]]; then
        echo "🪟 Reloading i3 configuration..."
        i3-msg reload >/dev/null 2>&1 || true
    fi
fi

# Restart picom if it's running
if pgrep -x picom >/dev/null; then
    echo "🎨 Restarting picom..."
    pkill picom
    sleep 0.5
    picom -b &
fi

# Update font cache if fonts were deployed
if [[ -d ~/.local/share/fonts ]]; then
    echo "🔤 Updating font cache..."
    fc-cache -f ~/.local/share/fonts 2>/dev/null || true
fi

# Create vim/nvim backup directories
echo "📁 Creating editor backup directories..."
mkdir -p ~/.cache/vim/{backup,swap,undo}
mkdir -p ~/.cache/nvim/{backup,swap,undo}


# Git configuration check
if [[ -f ~/.config/git/config && -f ~/.config/git/config.local ]]; then
    echo "✓ Git configuration includes found"
else
    echo "⚠ Remember to create ~/.config/git/config.local with your personal Git settings"
fi

# Check if running in X11 and update monitor config
if [[ -n "$DISPLAY" ]]; then
    if [[ -x ~/.screenlayout/monitor.sh ]]; then
        echo "🖥️ Applying monitor configuration..."
        ~/.screenlayout/monitor.sh 2>/dev/null || echo "  ⚠ Monitor configuration failed"
    fi
fi

echo "✨ Post-deployment complete!"

# Note: Kalu service is managed independently of dotfiles
# To enable/configure kalu: systemctl --user enable --now kalu.service
# Kalu uses system-default configuration at /etc/kalu/kalu.conf

# Clean up any repository files that shouldn't be in home
if [[ -f ~/README.md || -f ~/README.dotter.md ]]; then
    echo "🧹 Cleaning up repository files from home directory..."
    rm -f ~/README.md ~/README.dotter.md ~/Taskfile.yaml ~/ROADMAP.md 2>/dev/null || true
fi

# Send desktop notification if possible
if command -v notify-send >/dev/null 2>&1 && [[ -n "$DISPLAY" ]]; then
    notify-send "Dotfiles Deployed" "Configuration files have been successfully deployed" -i checkbox-checked
fi