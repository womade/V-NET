#!/bin/sh

# Download and install V-NET
mkdir /tmp/v-net
curl -L -H "Cache-Control: no-cache" -o /tmp/v-net/v-net.zip https://github.com/womade/V-NET/raw/main/v-net.zip
unzip /tmp/v-net/v-net.zip -d /tmp/v-net
install -m 755 /tmp/v-net/v-net /usr/local/bin/v-net

# V-NET new configuration
install -d /usr/local/etc/v-net
envsubst '\$UUID,\$WS_PATH' < /tmp/v-net/config/$PROTOCOL"_ws_tls.json" > /usr/local/etc/v-net/config.json

# MK TEST FILES
mkdir /opt/test
cd /opt/test/
dd if=/dev/zero of=100MB.BIN bs=100M count=1
dd if=/dev/zero of=10MB.BIN bs=10M count=1

# Remove temporary directory
rm -rf /tmp/v-net

# Run V-NET
/usr/local/bin/v-net run -c /usr/local/etc/v-net/config.json &

# Run nginx
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'