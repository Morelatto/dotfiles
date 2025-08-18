#!/usr/bin/env python3
"""
FontAwesome icon generator script for polybar/i3blocks
Uses fontawesome library to safely generate icons
"""

import sys

# Icon mappings using FontAwesome names
ICONS = {
    'terminal': '\uf120',  # fa-terminal
    'browser': '\uf0c2',   # fa-cloud (or firefox)
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