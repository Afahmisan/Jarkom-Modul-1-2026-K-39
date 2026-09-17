#!/bin/bash

apt update || true
apt install openssh-server

id -u mika_admin &>/dev/null || useradd -m -s /bin/bash mika_admin

mkdir -p /home/mika_admin/.ssh
touch /home/mika_admin/.ssh/authorized_keys

chmod 700 /home/mika_admin/.ssh
chmod 600 /home/mika_admin/.ssh/authorized_keys
chown -R mika_admin:mika_admin /home/mika_admin/.ssh

cat << 'CONF' > /etc/ssh/sshd_config.d/mika_auth.conf
PubkeyAuthentication yes
PasswordAuthentication no
CONF

DebianBanner no

sshd -t
service ssh restart
echo "[+++++] Server OpenSSH di Knights SIAK KING"
