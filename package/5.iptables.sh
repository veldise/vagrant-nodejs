#!/bin/sh
echo "- append iptables port"
# iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
# iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport 3030 -j ACCEPT
# iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
# iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3030 -j ACCEPT
# iptables -D INPUT -j REJECT --reject-with icmp-host-prohibited
# iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited
# service iptables save
# service iptables restart
service iptables stop
