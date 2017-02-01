#!/bin/bash

echo -n "What is the FQDN of the VPN server?: "
read SERVERNAME

docker-compose run --rm openvpn ovpn_genconfig -u udp://${SERVERNAME}
docker-compose run --rm openvpn ovpn_initpki
