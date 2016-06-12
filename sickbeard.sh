#!/bin/sh
echo 'Installing updates . . .'
apt-get -q=2 update && apt-get -qqy upgrade

echo 'Install Sickbeard to /opt/sickbeard . . .'
mkdir -p /opt/sickbeard
apt-get install python-cheetah
git clone git://github.com/midgetspy/Sick-Beard.git /opt/sickbeard
cd /opt/sickbeard
# python SickBeard.py
useradd -m sickbeard
echo 'sickbeard user created!'
chown -R sickbeard:sickbeard /opt/sickbeard

echo '===================================================================================='
echo '`cd /opt/sickbeard && python SickBeard.py` to start Sickbeard!'
echo 'Add the line `@reboot sickbeard python /opt/sickbeard/SickBeard.py` to /etc/crontab'
echo '===================================================================================='
