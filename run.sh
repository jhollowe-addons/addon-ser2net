#!/usr/bin/with-contenv bashio

cat > /etc/ser2net.conf << EOF
7000:telnet:0:/dev/ttyUSB0:1000000 8DATABITS NONE 1STOPBIT remctl
EOF

echo "jhollowe test"
which ser2net
ser2net -v


ser2net