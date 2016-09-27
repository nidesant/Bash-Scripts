#!/bin/bash

#Takes a daily backup of /var/log/messages for archival purposes. Has to be run as root.
#Script uses cd command instead of absolute paths for security reasons. 
#Will send email to $admin if backup is successful.

admin="foo@bar.com"
of=messages-backup-$(date +%Y%m%d).tgz

cd /var/log/

tar -czvf $of messages

if [ $? -eq 0 ]; then
  mail -s "Backup of /var/log/messages was successful!" $admin
else
  mail -s "Backup of /var/log/messages has failed!" $admin
fi

cp $of /home/user/
rm -rf $of




