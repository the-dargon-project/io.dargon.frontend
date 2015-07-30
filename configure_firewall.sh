#!/bin/bash
# Flush all current rules from iptables
iptables -F

# Allow SSH connections on tcp port 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Set default policies for INPUT, FORWARD and OUTPUT chains
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Set access for localhost
iptables -A INPUT -i lo -j ACCEPT

# Accept packets belonging to established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Open Port 80 - io.dargon.frontend
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Save settings
/sbin/service iptables save

# List rules
iptables -L -v
