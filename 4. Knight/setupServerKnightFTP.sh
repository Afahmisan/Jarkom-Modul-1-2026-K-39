#!/bin/bash
which ftp || (apt update || true && apt install -y ftp)

ftp -inv 10.83.2.2 << 'EOF'
user alice alice
put /root/knights_report.txt knights_report.txt
bye
EOF