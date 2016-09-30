#!/bin/bash

#Run as root
#Run as cron every n # of days you want your backup files rotated
#To be run on remote server hosting backups defined in backup.sh

admin="foo@bar.com"
dir_check=`ls /mnt/backup/`

cd /mnt/backup/

rm -rf *

if [ -z "$dir_check" ]; then
  echo Success | mail -s "Backup tars rotated successfully" $admin
else
  echo Failure | mail -s "Backup tars were not deleted successfully. Check the server before disk space begins to fill." $admin
fi
