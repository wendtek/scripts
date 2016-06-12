#!/bin/sh

grep -i "refused connect" /var/log/secure* | awk '{print $9}' | xargs echo "Deny Host:" | xargs /root/scripts/twitpost.sh 
