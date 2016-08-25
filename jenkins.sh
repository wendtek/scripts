#!/bin/bash
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install -y jenkins ufw

ufw logging on
ufw allow 8080/tcp
ufw allow from 192.168.1.0/24 to any port 22 proto tcp
ufw enable
