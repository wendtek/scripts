#!/bin/sh
echo 'Installing updates . . .'
apt-get -q=2 update && apt-get -qqy upgrade

wget https://downloads.plex.tv/plex-media-server/0.9.16.6.1993-5089475/plexmediaserver_0.9.16.6.1993-5089475_amd64.deb
dpkg -i plexmediaserver_0.9.16.6.1993-5089475_amd64.deb
rm plexmediaserver_0.9.16.6.1993-5089475_amd64.deb

echo '======================================================================='
echo 'Visit http://my_ip:32400 to configure Plex!'
echo '`service plexmediaserver restart` to restart Plex!'
echo '======================================================================='
