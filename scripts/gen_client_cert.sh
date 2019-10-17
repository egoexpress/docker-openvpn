#!/bin/bash

echo -n "Enter the FQDN of the client: "
read CLIENTNAME

OVPN_DATA="openvpn_config"

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $CLIENTNAME > ${CLIENTNAME}.ovpn

echo "Client certificate is now in $CLIENTNAME.ovpn"
