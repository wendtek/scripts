#!/bin/sh
apt-get update && apt-get -y upgrade
apt-get -y install vim wget irssi rbenv ruby-build mutt tmux pwgen elinks silversearcher-ag sysv-rc-conf golang openssh-server
apt-get -y install gimp firefox libreoffice php5 gedit vlc wireshark zsh tightvncserver ntp python-pip fail2ban remmina
apt-get -y install curl guake nmap libssl-dev lynx chromium-browser libappindicator-dev nodejs libsqlite3-dev elinks traceroute
apt-get -y install dropbox bless inkscape

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

apt-get -y install libffi-dev
sudo pip install awscli powerline-status cryptography
