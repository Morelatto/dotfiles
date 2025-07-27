#!/usr/bin/env zsh
# Network and connectivity aliases

# Basic network commands
alias ip='ip -color=auto'
alias ipv4='ip -4 addr'
alias ipv6='ip -6 addr'
alias hosts='cat /etc/hosts'
alias resolv='cat /etc/resolv.conf'
alias dns='resolvectl status'
alias pingd='ping -c3 archlinux.org'
alias ipe='curl ifconfig.me'
alias tracert='traceroute'
alias traces='sudo traceroute -I'
alias wget='wget -c'
alias speedtest='speedtest-cli'
alias netstat='netstat -tulnp'
alias iptables='sudo iptables -L -v -n'
alias curl='curl -v'

# WiFi management
alias wifidev='nmcli device wifi list'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'
alias wificonnect='nmcli device wifi connect'
alias wifiinfo='nmcli device show'

# Firewall management
alias stopfw='sudo systemctl stop ufw'
alias startfw='sudo systemctl start ufw'
alias restartfw='sudo systemctl restart ufw'

# Network monitoring
alias tcpdump='sudo tcpdump -i any -nn -s 0 -vvv'
alias capture_http='sudo tcpdump -i any -nn -s 0 -vvv -A port 80'
alias capture_https='sudo tcpdump -i any -nn -s 0 -vvv port 443'

# Host file editing
alias vhost='sudo vim /etc/hosts'

# VPN management
alias startvpn='sudo wg-quick up wg0'
alias stopvpn='sudo wg-quick down wg0'