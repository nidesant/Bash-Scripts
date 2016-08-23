#!/bin/bash

:' This script will check if the specified user has been added to the servers 
specified in the ips.txt file by checking /etc/passwd. Additionally, results will be 
written to a log file called check_user.log with the host, username, date, and time.
SSH connections are made with password auth and strict host key chekcing disabled.
: 

#Written by Nick DeSantis

IP=`cat ips.txt`
now=$(date '+%d-%m-%y')
t=$(date '+%T')

echo "Please enter a user:"
read user

for i in ${IP};
do
echo '------------------------------------------------------------';
echo "Connecting to $i";
echo "";
STATUS=`ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o PasswordAuthentication=no $i "cat /etc/passwd" | grep "$user";`
if [ -z $STATUS ];
then
echo "The user does not appear to be on the system";
echo "${i} ${user} ${now} ${t}" >> check_user.log;
fi
echo $STATUS;
echo '------------------------------------------------------------';
echo "";
done;
