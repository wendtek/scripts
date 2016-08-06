#!/bin/bash
apt-get install ufw
ufw logging on
ufw allow 22/tcp
ufw enable
