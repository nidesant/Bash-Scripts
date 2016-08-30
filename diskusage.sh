#!/bin/bash

admin="nidesant@gmail.com"
threshold="85"

df -h | tail -n +2 | awk '{print $1 " " $5}' | sed '/.//' | while read i; do
  part=$(echo $1 | awk '{print $1}'
  util=$(echo $5 | awk '{print $5}'
    if [ $util -ge $ $threshold}; then
      echo $part is %{util}% full. An email has been sent to your administrator."
      mail -s "Critical Alert: $part is ${util}% full. Clear space immeadiately" $admin
    fi
done
