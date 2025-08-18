#!/bin/bash
echo "🔧 Running post-deployment tasks..."

if [[ $- == *i* ]]; then
    source ~/.zshenv 2>/dev/null || true
fi

[[ ! -f ~/.cache/zsh/.zhistory ]] && touch ~/.cache/zsh/.zhistory

if [[ -d ~/.ssh ]]; then
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/config 2>/dev/null || true
    chmod 700 ~/.ssh/sockets 2>/dev/null || true
fi

if pgrep -x i3 >/dev/null && [[ -f ~/.config/i3/config ]]; then
    if [[ $(find ~/.config/i3/config -mtime -10s 2>/dev/null) ]]; then
        i3-msg reload >/dev/null 2>&1 || true
    fi
fi

if pgrep -x picom >/dev/null; then
    pkill picom && sleep 0.5 && picom -b &
fi

[[ -d ~/.local/share/fonts ]] && fc-cache -f ~/.local/share/fonts 2>/dev/null || true

mkdir -p ~/.cache/{vim,nvim}/{backup,swap,undo}

if [[ ! -f ~/.config/git/config.local ]]; then
    echo "⚠ Remember to create ~/.config/git/config.local with your personal Git settings"
fi

if [[ -n "$DISPLAY" && -x ~/.screenlayout/monitor.sh ]]; then
    ~/.screenlayout/monitor.sh 2>/dev/null || true
fi

[[ -f ~/README.md ]] && rm -f ~/README.md 2>/dev/null || true

if command -v notify-send >/dev/null 2>&1 && [[ -n "$DISPLAY" ]]; then
    notify-send "Dotfiles Deployed" "Configuration files have been successfully deployed" -i checkbox-checked
fi

echo "✨ Post-deployment complete!"