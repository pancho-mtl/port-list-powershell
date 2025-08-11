#!/bin/bash
# Display open TCP and UDP ports with the application name

echo "=== Open TCP Ports ==="
sudo ss -tulpn | grep -i tcp | awk '{print $1, $5, $7}'

echo
echo "=== Open UDP Ports ==="
sudo ss -tulpn | grep -i udp | awk '{print $1, $5, $7}'


#=== Open TCP Ports ===
#tcp 0.0.0.0:22  1234/sshd
#tcp 127.0.0.1:3306  5678/mysqld
#
#=== Open UDP Ports ===
#udp 0.0.0.0:68  910/dhclient

