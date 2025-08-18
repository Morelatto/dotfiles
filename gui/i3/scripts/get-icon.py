#!/usr/bin/env python3
"""
FontAwesome icon generator script for polybar/i3blocks
Uses fontawesome library to safely generate icons
"""

import sys

# Icon mappings using FontAwesome names
ICONS = {
    'terminal': '\uf120',  # fa-terminal
    'browser': '\uf268',   # fa-globe (browser icon)
    'files': '\uf07b',     # fa-folder
    'bluetooth': '\uf293', # fa-bluetooth
    'disk': '\uf0a0',      # fa-hdd
    'cpu': '\uf2db',       # fa-microchip  
    'memory': '\uf538',    # fa-memory
    'temperature': '\uf2c9', # fa-thermometer
    'ethernet': '\uf796',  # fa-ethernet
    'wifi': '\uf1eb',      # fa-wifi
    'network': '\uf6ff',   # fa-network-wired
    'volume': '\uf028',    # fa-volume-up
    'power': '\uf011',     # fa-power-off
    'settings': '\uf013',  # fa-cog
    'time': '\uf017',      # fa-clock
    'help': '\uf059',      # fa-question-circle
    'remote': '\uf108',    # fa-desktop (remote desktop)
    'remmina': '\uf108',   # fa-desktop (remote desktop)
    'firefox': '\uf269',   # fa-firefox
    'code': '\uf121',      # fa-code
    'obsidian': '\uf15c',  # fa-file-text
    'pycharm': '\uf121',   # fa-code
    'thunar': '\uf07b',    # fa-folder (file manager)
    'discord': '\uf23a',   # fa-comment-alt (chat/discord)
    'spotify': '\uf1bc',   # fa-spotify
    'vlc': '\uf03d',       # fa-video
    'gimp': '\uf1fc',      # fa-paint-brush
    'docker': '\uf308',    # fa-docker
    'vim': '\uf15c',       # fa-file-text
    'nvim': '\uf15c',      # fa-file-text
    'kitty': '\uf120',     # fa-terminal
    'alacritty': '\uf120', # fa-terminal
    'gnome-terminal': '\uf120'  # fa-terminal
}

def get_icon(icon_name):
    """Get FontAwesome icon by name"""
    return ICONS.get(icon_name, '\uf128')  # default to question mark

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: get-icon.py <icon_name>")
        sys.exit(1)
    
    icon_name = sys.argv[1]
    print(get_icon(icon_name), end='')