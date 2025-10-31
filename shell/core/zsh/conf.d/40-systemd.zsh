#!/usr/bin/env zsh
# Systemd - Service lifecycle management

# =============================================================================
# Systemd - Service and system management
# =============================================================================
if (( $+commands[systemctl] )); then
    # Service control
    alias sc='systemctl'
    alias scs='systemctl status'
    alias scstart='sudo systemctl start'
    alias scstop='sudo systemctl stop'
    alias screstart='sudo systemctl restart'
    alias screload='sudo systemctl reload'
    alias scenable='sudo systemctl enable'
    alias scdisable='sudo systemctl disable'

    # Service queries
    alias sclist='systemctl list-units'
    alias scfailed='systemctl --failed'
    alias scservices='systemctl list-units --type=service'
    alias sctimers='systemctl list-timers'

    # Daemon management
    alias scdaemon-reload='sudo systemctl daemon-reload'

    # Journal logs
    alias jctl='journalctl'
    alias jctlf='journalctl -f'
    alias jctlu='journalctl -u'
    alias jctlb='journalctl -b'
    alias jctltoday='journalctl --since=today'
    alias jctlerr='journalctl -p err'

    # Power management
    alias poweroff='systemctl poweroff'
    alias reboot='systemctl reboot'
    alias suspend='systemctl suspend'
    alias hibernate='systemctl hibernate'
fi
