#!/bin/bash

: ' This script checks the current space on each partition. This should 
ideally be ran as a cron job and an email alert should be sent to an amdin
when disk space is 85% and over. 
'

#Written by Nick DeSantis

admin="nidesant@gmail.com"
threshold="85"

df -h | tail -n +2 | awk '{print $1 " " $5}' | sed 's/.$//' | while read i; do
  part=$(echo $i | awk '{print $1}')
  util=$(echo $i | awk '{print $2}')
    if [ $util -ge $threshold ]; then
      echo $part is ${util}% full. An email has been sent to your administrator.
      mail -s "Critical: $part is ${util}% full. Clear space immeadiately!" $admin </dev/null
    fi
done
