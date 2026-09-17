#!/bin/bash
which ftp || (apt update || true && apt install -y ftp)

ftp -inv 10.83.2.2 << 'EOF'
user mika mika
put /root/protocol7_manifesto.txt protocol7_manifesto.txt
bye
EOF