#!/bin/bash

apt update || true
apt install -y openssh-server nginx
service ssh start
service nginx start