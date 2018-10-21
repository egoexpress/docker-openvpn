#!/bin/bash

echo -n "Enter the FQDN of the client: "
read CLIENTNAME

docker-compose exec openvpn easyrsa build-client-full $CLIENTNAME nopass
docker-compose exec openvpn ovpn_getclient $CLIENTNAME > certs/$CLIENTNAME.ovpn

echo -n "Enter the last part of your desired client IP [10.42.0.xx]: "
read IP_OCTET

IP_OCTET_1=$(expr ${IP_OCTET} + 1)
echo "ifconfig-push 10.42.0.${IP_OCTET} 10.42.0.${IP_OCTET_1}" > /opt/openvpn/conf/ccd/${CLIENTNAME}

echo "cipher AES-256-CBC" >> certs/$CLIENTNAME.ovpn

echo "Client certificate is now in certs/$CLIENTNAME.ovpn"
