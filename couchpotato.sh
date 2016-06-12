#!/bin/sh
echo 'Installing updates . . .'
apt-get -q=2 update && apt-get -qqy upgrade

echo 'Install couchpotato to /opt/couchpotato . . .'
apt-get -yq install git-core libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential
pip install lxml cryptography pyopenssl
mkdir -p /opt/couchpotato
git clone https://github.com/RuudBurger/CouchPotatoServer /opt/couchpotato
cp /opt/couchpotato/init/ubuntu.default /etc/default/couchpotato
cp /opt/couchpotato/init/ubuntu /etc/init.d/couchpotato
chmod +x /etc/init.d/couchpotato
update-rc.d couchpotato defaults
useradd -m couchpotato
chown -R couchpotato:couchpotato /opt/couchpotato
cp ./conf/couchpotato /etc/default/couchpotato
echo 'couchpotato user created!'

echo '======================================================================='
echo 'Update the /etc/default/couchpotato file with your settings!'
echo 'REMEMBER! couchpotato user created!'
echo '======================================================================='
