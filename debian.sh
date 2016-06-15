#!/bin/sh
aptitude update && aptitude -y upgrade
aptitude -y install vim wget irssi rbenv ruby-build mutt tmux pwgen elinks silversearcher-ag sysv-rc-conf golang openssh-server
aptitude -y install zsh ntp python-pip openjdk-7-jre fail2ban
aptitude -y install curl nmap libssl-dev lynx libappindicator-dev nodejs libsqlite3-dev traceroute

# https://wiki.debian.org/DebianMultimedia/FFmpeg

sudo pip install awscli
