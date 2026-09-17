#!/bin/bash

apt update || true
apt install -y vsftpd ftp

mkdir -p /var/wired/data
chmod 777 /var/wired/data
echo "Selamat datang di The Wired Data - Chisa Server" > /var/wired/data/welcome.txt

id -u alice &>/dev/null || useradd -m -s /bin/bash alice
echo "alice:alice" | chpasswd

id -u mika &>/dev/null || useradd -m -s /bin/bash mika
echo "mika:mika" | chpasswd

id -u eiri &>/dev/null || useradd -m -s /bin/bash eiri
echo "eiri:eiri" | chpasswd

cat << 'CONF' > /etc/vsftpd.conf
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES

local_root=/var/wired/data
chroot_local_user=YES
allow_writeable_chroot=YES

pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40100

user_config_dir=/etc/vsftpd/user_conf
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=YES
CONF

mkdir -p /etc/vsftpd/user_conf

echo "write_enable=YES" > /etc/vsftpd/user_conf/alice
echo "local_root=/var/wired/data" >> /etc/vsftpd/user_conf/alice

echo "write_enable=NO" > /etc/vsftpd/user_conf/mika
echo "local_root=/var/wired/data" >> /etc/vsftpd/user_conf/mika

echo "eiri" > /etc/vsftpd.userlist

service vsftpd restart
echo "[+++] Layanan vsFTPd Chisa aktif dan siap digunakan."
