#!/usr/bin/env zsh
# System & Network Tools - System management and network utilities

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

# =============================================================================
# IP Command - Modern network management
# =============================================================================
if (( $+commands[ip] )); then
    # Address management
    alias ipa='ip address'
    alias ipas='ip address show'
    alias ipaa='sudo ip address add'
    alias ipad='sudo ip address del'

    # Link management
    alias ipl='ip link'
    alias ipls='ip link show'
    alias iplset='sudo ip link set'

    # Route management
    alias ipr='ip route'
    alias iprs='ip route show'
    alias ipra='sudo ip route add'
    alias iprd='sudo ip route del'
    alias iprg='ip route get'

    # Neighbor (ARP) table
    alias ipn='ip neigh'
    alias ipns='ip neigh show'

    # Display options
    alias ipc='ip -color'        # Colored output
    alias ipb='ip -brief'         # Brief output
    alias ipbc='ip -brief -color' # Brief + colored
    alias ip4='ip -4'             # IPv4 only
    alias ip6='ip -6'             # IPv6 only

    # Common shortcuts
    alias ipaddr='ip -brief -color address'
    alias iproute='ip -color route'
    alias iplink='ip -brief link'
fi

# =============================================================================
# NetworkManager - nmcli shortcuts
# =============================================================================
if (( $+commands[nmcli] )); then
    # Connection management
    alias nmc='nmcli connection'
    alias nmcshow='nmcli connection show'
    alias nmcup='nmcli connection up'
    alias nmcdown='nmcli connection down'
    alias nmcmod='nmcli connection modify'
    alias nmcdel='sudo nmcli connection delete'

    # Device management
    alias nmd='nmcli device'
    alias nmdstatus='nmcli device status'
    alias nmdconnect='nmcli device connect'
    alias nmddisconnect='nmcli device disconnect'

    # WiFi specific
    alias nmwifi='nmcli device wifi'
    alias nmwifilist='nmcli device wifi list'
    alias nmwificonnect='nmcli device wifi connect'
    alias nmwifiscan='nmcli device wifi rescan'

    # General status
    alias nmstatus='nmcli general status'
    alias nmhostname='nmcli general hostname'
fi

# =============================================================================
# Firewall - UFW shortcuts
# =============================================================================
if (( $+commands[ufw] )); then
    # Status and control
    alias ufwstatus='sudo ufw status verbose'
    alias ufwlist='sudo ufw status numbered'
    alias ufwenable='sudo ufw enable'
    alias ufwdisable='sudo ufw disable'
    alias ufwreload='sudo ufw reload'
    alias ufwreset='sudo ufw --force reset'

    # Rule management
    alias ufwallow='sudo ufw allow'
    alias ufwdeny='sudo ufw deny'
    alias ufwreject='sudo ufw reject'
    alias ufwdelete='sudo ufw delete'
    alias ufwinsert='sudo ufw insert'

    # Common service rules
    alias ufwssh='sudo ufw allow ssh'
    alias ufwhttp='sudo ufw allow http'
    alias ufwhttps='sudo ufw allow https'

    # Application profiles
    alias ufwapp='sudo ufw app list'
    alias ufwappinfo='sudo ufw app info'

    # Logging
    alias ufwlog='sudo ufw logging'
    alias ufwlogon='sudo ufw logging on'
    alias ufwlogoff='sudo ufw logging off'
fi

# =============================================================================
# TCPDump - Network packet analyzer
# =============================================================================
if (( $+commands[tcpdump] )); then
    # Basic capture
    alias tcpd='sudo tcpdump'
    alias tcpdi='sudo tcpdump -i'
    alias tcpdany='sudo tcpdump -i any'

    # Output verbosity
    alias tcpdn='sudo tcpdump -n'      # Don't resolve hosts
    alias tcpdnn='sudo tcpdump -nn'    # Don't resolve hosts or ports
    alias tcpdv='sudo tcpdump -v'      # Verbose
    alias tcpdvv='sudo tcpdump -vv'    # Very verbose

    # Packet contents
    alias tcpdx='sudo tcpdump -X'      # Hex and ASCII
    alias tcpda='sudo tcpdump -A'      # ASCII only

    # Protocol filters
    alias tcpdtcp='sudo tcpdump tcp'
    alias tcpdudp='sudo tcpdump udp'
    alias tcpdicmp='sudo tcpdump icmp'
    alias tcpdarp='sudo tcpdump arp'

    # Common captures
    alias tcpdhttp='sudo tcpdump -i any -A "tcp port 80"'
    alias tcpdhttps='sudo tcpdump -i any "tcp port 443"'
    alias tcpddns='sudo tcpdump -i any "port 53"'
    alias tcpdssh='sudo tcpdump -i any "port 22"'

    # File operations
    alias tcpdwrite='sudo tcpdump -w'
    alias tcpdread='tcpdump -r'
fi

# =============================================================================
# WireGuard - VPN management
# =============================================================================
if (( $+commands[wg] )); then
    # Status and monitoring
    alias wgshow='sudo wg show'
    alias wgstatus='sudo wg show'
    alias wginterfaces='sudo wg show interfaces'
    alias wgpeers='sudo wg show peers'
    alias wgendpoints='sudo wg show endpoints'
    alias wgtransfer='sudo wg show transfer'
    alias wgwatch='watch -n 1 sudo wg show'

    # Quick controls
    alias wgup='sudo wg-quick up'
    alias wgdown='sudo wg-quick down'
    alias wgsave='sudo wg-quick save'

    # Configuration
    alias wgshowconf='sudo wg showconf'
    alias wgsetconf='sudo wg setconf'
    alias wgsyncconf='sudo wg syncconf'

    # Key generation
    alias wggenkey='wg genkey'
    alias wgpubkey='wg pubkey'
    alias wggenpsk='wg genpsk'

    # Helper functions
    wgrestart() {
        local interface="${1:-wg0}"
        sudo wg-quick down "$interface" && sudo wg-quick up "$interface"
    }
fi

# =============================================================================
# Process Management
# =============================================================================
# Process viewers
if (( $+commands[btop] )); then
    alias top='btop'
    alias htop='btop'
elif (( $+commands[htop] )); then
    alias top='htop'
fi

# Process listing
alias ps='ps aux'
alias pstree='pstree -a'
alias psgrep='ps aux | grep -v grep | grep -i'
alias pscpu='ps aux --sort=-%cpu | head -20'
alias psmem='ps aux --sort=-%mem | head -20'

# Process control
alias killall='killall -v'
if (( $+commands[fuser] )); then
    alias whoport='sudo fuser -v'
fi

# =============================================================================
# System Information
# =============================================================================
# Memory and CPU
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias diskinfo='df -h'
alias diskusage='du -h --max-depth=1'
alias mountinfo='mount | column -t'

# Network connections
alias ports='ss -tulanp'
alias listening='ss -tln'
alias connections='ss -tan'
alias established='ss -tan state established'

# =============================================================================
# Utility Functions
# =============================================================================
# Show all IP addresses
myip() {
    echo "Local IP addresses:"
    ip -brief -color address show | grep -v '^lo'

    if (( $+commands[curl] )); then
        echo -e "\nPublic IP address:"
        curl -s ifconfig.me || curl -s icanhazip.com || echo "Unable to fetch"
        echo
    fi
}

# Port information
portinfo() {
    local port="$1"
    if [[ -z "$port" ]]; then
        echo "Usage: portinfo <port>"
        return 1
    fi
    sudo ss -tulpn | grep ":$port"
}

# System summary
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

typer() { xdotool type "$(xsel -bo)"; }
