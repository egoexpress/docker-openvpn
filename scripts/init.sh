#!/bin/bash

echo -n "What is the FQDN of the VPN server?: "
read SERVERNAME

OVPN_DATA="openvpn_config"

docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://${SERVERNAME}
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
