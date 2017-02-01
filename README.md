# docker-openvpn

OpenVPN Docker Compose setup based on kylemanna/docker-openvpn

## Supported distros

This setup has been tested on Ubuntu 16.04.1 LTS.
As the version of _docker-compose_ is 1.5 on Ubuntu 16.04.1 LTS at the time of this writing and this version doesn't support v2
config files you have to update _docker-compose_ first

    sudo apt-get install python-pip
    sudo pip install --upgrade pip
    sudo pip install --upgrade docker-compose

## Prerequisites

* running [Docker](https://github.com/docker/docker) environment
* [docker-compose](https://github.com/docker/compose) with support for v2 configuration files (see above for upgrading
  _docker-compose_ if v2 files are not supported)

## Running & Administration

### Init VPN server

Initialize the server with _scripts/init.sh_. This has to be done only once. You have to provide the FQDN of the OpenVPN server.
This will be used in the ovpn files of the Cliens

### Start VPN server

Start the VPN server with _scripts/start.sh_. It will run a Docker container named _openvpn_.

### Generate Client certificate

Use _scripts/gen_client_cert.sh_ to generate a client certificate. You have to enter the FQDN of the client host and the password
for your CAs private key.
The script will generate a ovpn config file in _certs/CLIENTNAME.ovpn_.
