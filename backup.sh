#!/bin/bash

#Takes a daily backup of /var/log/messages for archival purposes. 
#To do: Set up email alert indicating success or failure, configure cron, edit path for where to place backup file. 

of=messages-backup-$(date +%Y%m%d).tgz

cd /var/log/
tar -czvf $of messages
cp $of /home/user/
rm -rf $of


