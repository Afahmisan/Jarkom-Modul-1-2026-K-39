which ftp || (apt update || true && apt install -y ftp)

ftp -inv 10.10.2.2 << 'EOF'
user eiri eiri
bye
EOF