#!/bin/sh
# TODO: Add Kodi -> https://kodi.tv/download/

echo 'Installing updates . . .'
apt-get -q=2 update && apt-get -qqy upgrade
echo 'Installing VLC, Transmission and minidlna . . .'
apt-get install -yq transmission-gtk transmission-cli transmission-common transmission-daemon minidlna vlc mplayer

apt-get -qy install samba cifs-utils

echo '======================================================================='
echo 'transmission, minidlna, and samba installed!'
echo 'edit `/etc/minidlna.conf` !'
echo 'transmission listening on port 9090!'
echo '======================================================================='
