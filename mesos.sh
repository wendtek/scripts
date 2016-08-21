#!/bin/sh
apt-get update && apt-get -y upgrade
apt-get -y install vim wget tmux elinks silversearcher-ag sysv-rc-conf
apt-get -y install ntp curl

echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list

# Setup
apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the Mesosphere repository
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  tee /etc/apt/sources.list.d/mesosphere.list
apt-get -y update
apt-get -y install mesos chronos
