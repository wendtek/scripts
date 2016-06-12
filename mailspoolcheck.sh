#!/bin/sh
TERM=linux
FILES=/var/spool/mail/*
for f in $FILES
do
  if [ -s $f ]
  then
    echo "Stuck Mail in Spool" | xargs /ebs/scripts/twitpost.sh
  fi
done

exit
