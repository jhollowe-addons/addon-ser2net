#!/usr/bin/with-contenv bashio

data_port=12345
admin_port=12346
device_path=$(bashio::config serial_device /dev/ttyACM0)
max_connections=$(bashio::config max_connections 1)

cat >> /etc/ser2net/ser2net.yaml << EOF

connection: &serport
  accepter: telnet(rfc2217)tcp,$data_port
  timeout: 0 # don't timeout on no activity
  enable: on
  connector: serialdev, $device_path,local
  options:
    max-connections: $max_connections

EOF
# TODO add a rotator that prints an error saying the port is in use? and then echo?

if bashio::config.true "enable_admin_interface"; then
cat >> /etc/ser2net/ser2net.yaml << EOF

admin:
  accepter: tcp,$admin_port

EOF
fi

echo "jhollowe test"
which ser2net
ser2net -v

bashio::addon.url


echo "skipping running"
# ser2net -d