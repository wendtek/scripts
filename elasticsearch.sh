#!/bin/bash
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.1/elasticsearch-2.4.1.deb -O /tmp/elasticsearch-2.4.1.deb
dpkg -i /tmp/elasticsearch-2.4.1.deb
rm /tmp/elasticsearch-2.4.1.deb
wget https://download.elastic.co/kibana/kibana/kibana-4.6.1-amd64.deb -O /tmp/kibana-4.6.1-amd64.deb
dpkg -i /tmp/kibana-4.6.1-amd64.deb
rm /tmp/kibana-4.6.1-amd64.deb

echo 'configure /etc/elasticsearch/elasticsearch.yml to listen on 9200'

# ufw stuff
# ufw logging on
# ufw allow from 192.168.1.0/24 to any port 9200 proto tcp
# ufw enable
