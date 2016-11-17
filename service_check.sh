#!/bin/bash

# Meant to automate starting or stopping of servies in large
# scale clusters or environments.
 
IP=`cat ips.txt`

echo "Please enter a service:"
read service

echo "Choose 'stop', 'start', or 'restart':"
read answer

for i in $IP;
do
echo '------------------------------------------------------------';
echo "Connecting to $i";
echo ""
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 -o PasswordAuthentication=no $i; sudo su -; service $service $answer;
echo '------------------------------------------------------------';
echo "";
done;
  
