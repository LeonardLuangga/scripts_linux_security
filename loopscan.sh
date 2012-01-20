#!/bin/bash
#
# won't tell you guys anything about this one. This one is for private usage :P


FIRST="195"
SECOND="212"

while [ $SECOND -lt 256 ]
do
  ./start $FIRST.$SECOND
  SECOND=$[$SECOND+1]
  sleep 600
done


#for cron
#
# CURDIR = "$(pwd)"
# echo "* 18 * * * $CURDIR/loopscan.sh >/dev/null 2>&1" > cron
# crontab cron
