#!/bin/bash
apt-get update
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.1/elasticsearch-2.4.1.deb
dpkg -i elasticsearch-2.4.1.deb
rm elasticsearch-2.4.1.deb

echo 'configure /etc/elasticsearch/elasticsearch.yml to listen on 9200'

# ufw stuff
# ufw logging on
# ufw allow from 192.168.1.0/24 to any port 9200 proto tcp
# ufw enable
