#!/bin/bash
apt-get install ufw
ufw logging on
ufw allow proto tcp from 192.168.1.0/24 to any port 22
ufw allow proto udp from 192.168.1.0/24 to any port 500
ufw allow proto udp from 192.168.1.0/24 to any port 4500
ufw enable
