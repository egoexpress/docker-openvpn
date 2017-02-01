#!/bin/bash

echo -n "Enter the FQDN of the client: "
read CLIENTNAME

docker-compose exec openvpn easyrsa build-client-full $CLIENTNAME nopass
docker-compose exec openvpn ovpn_getclient $CLIENTNAME > certs/$CLIENTNAME.ovpn

echo "Client certificate is now in certs/$CLIENTNAME.ovpn"
