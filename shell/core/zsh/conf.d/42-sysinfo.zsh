#!/usr/bin/env zsh
# System Information - Hardware and resource inspection

# =============================================================================
# Memory and CPU
# =============================================================================
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias diskinfo='df -h'
alias diskusage='du -h --max-depth=1'
alias mountinfo='mount | column -t'

# =============================================================================
# System Summary
# =============================================================================
sysinfo() {
    echo "=== System Information ==="
    echo "Hostname: $(hostname)"
    echo "Kernel: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo
    echo "=== Memory ==="
    free -h
    echo
    echo "=== Disk Usage ==="
    df -h /
    echo
    echo "=== Network ==="
    ip -brief -color address show | grep -v '^lo'
}
