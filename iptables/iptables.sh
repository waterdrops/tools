#!/bin/sh

source /etc/profile
iptables -F

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -s 10.162.202.0/24 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 28080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 28081 -s 115.238.225.87 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 18001 -s 115.238.225.87 -j ACCEPT
iptables -A INPUT -j DROP

