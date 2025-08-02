#!/usr/bin/env zsh
# Desktop Environment Configuration - X11, clipboard, and GUI tools

# Skip if not in X11/Wayland environment
[[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]] && return 0

# =============================================================================
# Clipboard operations
# =============================================================================
if (( $+commands[xsel] )); then
    alias copy='xsel -ib'
    alias paste='xsel -o'
    alias copyclip='xsel -ib'
    alias pasteclip='xsel -ob'
elif (( $+commands[xclip] )); then
    alias copy='xclip -selection clipboard'
    alias paste='xclip -selection clipboard -o'
    alias copyclip='xclip -selection clipboard'
    alias pasteclip='xclip -selection clipboard -o'
elif (( $+commands[wl-copy] )); then
    # Wayland clipboard support
    alias copy='wl-copy'
    alias paste='wl-paste'
fi

# =============================================================================
# X11/Display utilities
# =============================================================================
if (( $+commands[xset] )); then
    alias dpmsoff='xset dpms force off'
    alias dpmson='xset dpms force on'
    alias screensaver='xset s activate'
fi

if (( $+commands[xrdb] )); then
    alias xreload='xrdb -merge ~/.Xresources'
fi

if (( $+commands[xrandr] )); then
    alias screens='xrandr'
    alias screeninfo='xrandr --verbose'
fi

# =============================================================================
# Screenshot tools
# =============================================================================
if (( $+commands[scrot] )); then
    alias screenshot='scrot ~/Pictures/screenshot-%Y%m%d-%H%M%S.png'
    alias screenshot-select='scrot -s ~/Pictures/screenshot-%Y%m%d-%H%M%S.png'
elif (( $+commands[maim] )); then
    alias screenshot='maim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png'
    alias screenshot-select='maim -s ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png'
fi

# =============================================================================
# Common GUI applications shortcuts
# =============================================================================
(( $+commands[firefox] )) && alias ff='firefox'
(( $+commands[chromium] )) && alias chrome='chromium'
(( $+commands[code] )) && alias vscode='code'
(( $+commands[thunar] )) && alias files='thunar'
(( $+commands[nautilus] )) && alias files='nautilus'
(( $+commands[dolphin] )) && alias files='dolphin'