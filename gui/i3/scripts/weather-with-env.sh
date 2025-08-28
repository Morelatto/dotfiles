#!/bin/bash
# Weather script wrapper that loads environment variables

# Load secrets from age if available
if [[ -f "$HOME/.config/secrets.age" ]] && command -v age >/dev/null 2>&1; then
    eval "$(age --decrypt -i ~/.config/age/keys.txt ~/.config/secrets.age 2>/dev/null)"
fi

# Execute the weather script
exec ~/.config/i3/scripts/weather "$@"