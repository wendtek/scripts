#!/bin/sh
apt-get update && apt-get -y upgrade
apt-get -y install aptitude vim wget irssi rbenv ruby-build mutt tmux \
pwgen elinks silversearcher-ag sysv-rc-conf golang openssh-server \
gimp firefox libreoffice gedit vlc wireshark zsh \
tightvncserver ntp python-pip fail2ban remmina httpie \
curl guake nmap libssl-dev lynx libappindicator-dev nodejs \
libsqlite3-dev traceroute libcurl3 dropbox bless inkscape pidgin \
docker.io libpq-dev libpcap-dev httpie libffi-dev

# heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

pip install --upgrade pip
pip install setuptools awscli powerline-status cryptography
