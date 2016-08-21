#!/bin/sh
apt-get update && aptitude -y upgrade
apt-get -y install vim wget mutt tmux pwgen elinks silversearcher-ag \
sysv-rc-conf openssh-server httpie zsh ntp python-pip aptitude \
curl nmap libssl-dev lynx libappindicator-dev nodejs libsqlite3-dev traceroute
