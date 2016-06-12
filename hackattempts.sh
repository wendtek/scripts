#!/bin/bash
clear
date
TERM=linux

echo "Banned attacker IP addresses:"
for i in $(awk 'gsub(".*sshd.*refused connect from (banned ip )?","") {print $1}' /var/log/secure* |awk '{print $NF}')
do
    echo -e "${i} $(curl -s http://www.geoiptool.com/en/?IP=${i} |grep marker |egrep "Country|City" |awk -F \: '{print $4 $5}' |sed 's/[<>]/,/g' |awk -F , \
'{print $1","$7}')\n"
    echo -e "\n"
done
