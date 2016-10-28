#!/bin/sh
apt-get update
apt-get install -y apt-transport-https ca-certificates
# Debian Jessie
echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
# Ubuntu 14
# deb https://apt.dockerproject.org/repo ubuntu-trusty main
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update
apt-get install -y docker-engine
pip install --upgrade pip
pip install docker-compose
service docker start
docker run hello-world
