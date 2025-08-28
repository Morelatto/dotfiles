#!/bin/bash

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

mkdir -p ~/.cache/{vim,nvim}/{backup,swap,undo}


[[ -f ~/README.md ]] && rm -f ~/README.md 2>/dev/null || true