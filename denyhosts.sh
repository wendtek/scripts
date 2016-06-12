#!/bin/sh
TERM=linux
DAYMON=$(date +'%a %b')
DATE=$(date +'%-d')
YEAR=$(date +'%Y')
#grep "Mon Oct  3 [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2011" /etc/hosts.deny
#TESTDATE="Mon Oct  3 [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2011"
POST=`grep -n "$DAYMON $DATE [0-9][0-9]:[0-9][0-9]:[0-9][0-9] $YEAR" /etc/hosts.deny | awk '{print $10}'`
#echo $POST
#grep -n "$TESTDATE" /etc/hosts.deny | awk '{print $10}'

if [[ $POST == *[0-9]* ]]
then
  `echo "New Asshole: $POST" | xargs /ebs/scripts/twitpost.sh`;
fi

exit
