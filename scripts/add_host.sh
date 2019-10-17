#!/bin/bash

HOSTNAME="$1"
CLIENTIP="$2"

echo "ifconfig-push ${CLIENTIP} 255.255.255.0" > /tmp/${HOSTNAME}
docker cp /tmp/${HOSTNAME} openvpn_app_1:/etc/openvpn/ccd
rm -f /tmp/${HOSTNAME}
