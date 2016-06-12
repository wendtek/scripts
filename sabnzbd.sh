#!/bin/sh
echo 'Installing updates . . .'
apt-get -q=2 update && apt-get -qqy upgrade

apt-get -qy install python-gdbm python-cheetah python-openssl par2 unzip
rm /etc/apt/sources.list.d/sabnzbdplus.list
echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu precise main" | tee -a /etc/apt/sources.list.d/sabnzbdplus.list
apt-key adv --keyserver hkp://pool.sks-keyservers.net:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F
apt-get -q=2 update
apt-get -y install sabnzbdplus
useradd -m sabnzbd
echo 'sabnzbd user created!'
update-rc.d sabnzbdplus defaults
cp ./conf/sabnzbdplus /etc/default/sabnzbdplus

echo '======================================================================='
echo 'Update the /etc/default/sabnzbdplus file with your settings!'
echo '`service sabnzbdplus restart` to start Sabnzbd!'
echo 'REMEMBER! sabnzbd user created!'
echo '======================================================================='
