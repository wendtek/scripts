#!/bin/sh
apt-get -y install unzip
cd /tmp
wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.7.5.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

useradd -s /bin/false -m -d /home/consul consul
curl -sSL https://releases.hashicorp.com/consul/0.7.3/consul_0.7.3_linux_amd64.zip -o consul.zip
unzip consul.zip
chmod +x consul
mv consul /usr/bin/consul
mkdir -p /etc/consul.d/bootstrap
mkdir -p /etc/consul.d/server
mkdir -p /var/consul/data
chown -R consul:consul /var/consul
chmod a+w /etc/consul.d
