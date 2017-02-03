#!/bin/sh
apt-get -y install unzip
cd /tmp
wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.7.5.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

useradd -s /bin/false -m -d /home/nomad nomad
curl -sSL https://releases.hashicorp.com/nomad/0.5.4/nomad_0.5.4_linux_amd64.zip -o nomad.zip
unzip nomad.zip
chmod +x nomad
mv nomad /usr/bin/nomad
mkdir -p /etc/nomad.d
mkdir -p /var/nomad/data
chmod a+w /etc/nomad.d
chown -R nomad:nomad /var/nomad
