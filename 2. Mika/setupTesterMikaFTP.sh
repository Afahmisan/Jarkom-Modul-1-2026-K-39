which ftp || (apt update || true && apt install -y ftp)

echo "Mikas SUka" > /root/mika_coba.txt

ftp -inv 10.83.2.2 << 'EOF'
user mika mika
get welcome.txt /root/welcome_mika.txt
put /root/mika_coba.txt mika_coba.txt
bye

EOF