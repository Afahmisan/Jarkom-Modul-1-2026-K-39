#!/bin/bash

apt update
apt install openssh-client

id -u mika_admin &>/dev/null || useradd -m -s /bin/bash mika_admin

su - mika_admin -c "ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''"
echo "======================= KEY PUBLIC UNTUK KNIGHT ======================="
cat /home/mika_admin/.ssh/id_ed25519.pub
echo "======================================================================="