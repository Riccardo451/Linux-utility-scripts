#!/bin/bash
COMMAND='nohup python3 /home/pi/spyderco/hash_change.py > hashlog.log &'
LOGFILE=restart.txt

writelog() {
  now=`date`
  echo "$now $*" >> $LOGFILE
}

writelog "Starting"
while true ; do
  $COMMAND
  writelog "Exited with status $?"
  writelog "Restarting"
done

