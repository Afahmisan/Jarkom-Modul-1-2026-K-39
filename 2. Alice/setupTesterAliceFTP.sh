#!/bin/bash
which ftp || (apt update || true && apt install -y ftp)

echo "Bapakku Nelayan juraga pertanian" > /root/signal_alice.txt
ftp -inv 10.83.2.2 << 'EOF'
user alice alice
put /root/signal_alice.txt signal_alice.txt
bye
EOF