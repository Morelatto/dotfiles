#!/bin/bash
# i3blocks wrapper that loads environment variables before starting i3blocks

# Load secrets from age if available
if [[ -f "$HOME/.config/secrets.age" ]] && command -v age >/dev/null 2>&1; then
    eval "$(age --decrypt -i ~/.config/age/keys.txt ~/.config/secrets.age 2>/dev/null)"
fi

# Start i3blocks with the loaded environment
exec i3blocks -c ~/.config/i3/i3blocks.conf "$@"