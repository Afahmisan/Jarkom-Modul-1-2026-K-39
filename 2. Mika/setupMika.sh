auto eth0
iface eth0 inet static
    address 10.83.1.3
    netmask 255.255.255.0
    gateway 10.83.1.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf