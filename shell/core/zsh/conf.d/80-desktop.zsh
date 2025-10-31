#!/usr/bin/env zsh
# Desktop Environment Configuration - X11, clipboard, and GUI tools

# Skip if not in X11/Wayland environment
[[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]] && return 0

# =============================================================================
# X11 Automation
# =============================================================================
# Type clipboard contents (useful for password managers)
if (( $+commands[xdotool] && $+commands[xsel] )); then
    typer() { xdotool type "$(xsel -bo)"; }
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
# Desktop File Manager Cleanup
# =============================================================================
# Remove macOS .DS_Store files (Finder metadata)
nomac() {
    find . -name '.DS_Store' -delete
}

# =============================================================================
# Common GUI applications shortcuts
# =============================================================================
(( $+commands[firefox] )) && alias ff='firefox'
(( $+commands[chromium] )) && alias chrome='chromium'
(( $+commands[code] )) && alias vscode='code'
(( $+commands[thunar] )) && alias files='thunar'
(( $+commands[nautilus] )) && alias files='nautilus'
(( $+commands[dolphin] )) && alias files='dolphin'