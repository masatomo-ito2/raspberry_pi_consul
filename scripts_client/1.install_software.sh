#!/bin/bash

# update

sudo apt-get update
sudo apt-get install i2c-tools
sudo apt-get install python-smbus
sudo pip install smbus

# install consul

CONSUL_VERSION=1.6.2
CONSUL_ZIP=/tmp/consul.zip
wget -O ${CONSUL_ZIP} https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_arm64.zip
pushd /usr/local/bin
unzip ${CONSUL_ZIP}
popd

# config file
cat <<EOF> ~/config.json
{
        "disable_remote_exec": false
}
EOF

# data directory
mkdir ~/data_dir

# install python-consul
sudo pip install python-consul

