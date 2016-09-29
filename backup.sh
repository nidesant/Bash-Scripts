#!/bin/bash
#Directories to back up: /etc, /boot, /root, parts of var
#Will change cp line to scp and copy files to remote server

admin="foo@bar.com"
dir_one=etc-backup-$(date +%Y%m%d).tgz
dir_two=boot-backup-$(date +%Y%m%d).tgz
dir_three=usrlocal-backup-$(date +%Y%m%d).tgz
dir_four=root-backup-$(date +%Y%m%d).tgz
dir_five=home-backup-$(date +%Y%m%d).tgz

cd /tmp/

tar -czvf $dir_one /etc/; scp $dir_one root@54.245.32.2:/mnt/backup/; rm -rf $dir_one

if [ $? -eq 0 ]; then
  echo Success | mail -s "Backup of /etc was successful!" $admin
else
  echo Failure | mail -s "Backup of /etc has failed!" $admin
fi

tar -czvf $dir_two /boot/; scp $dir_two root@54.245.32.2:/mnt/backup/; rm -rf $dir_two

if [ $? -eq 0 ]; then
  echo Success | mail -s "Backup of /boot was successful!" $admin
else
  echo Failure | mail -s "Backup of /boot has failed!" $admin
fi

tar -czvf $dir_three /usr/local/; scp $dir_three root@54.245.32.2:/mnt/backup/; rm -rf $dir_three

if [ $? -eq 0 ]; then
  echo Success | mail -s "Backup of /usr/local was successful!" $admin
else
  echo Failure | mail -s "Backup of /usr/local has failed!" $admin
fi

tar -czvf $dir_four /root/; scp $dir_four root@54.245.32.2:/mnt/backup/; rm -rf $dir_four

if [ $? -eq 0 ]; then
  echo Success | mail -s "Backup of /root was successful!" $admin
else
  echo Failure | mail -s "Backup of /root has failed!" $admin
fi

tar -czvf $dir_five /home/; scp $dir_five root@54.245.32.2:/mnt/backup/; rm -rf $dir_five

if [ $? -eq 0 ]; then
  echo Success | mail -s "Backup of /home was successful!" $admin
else
  echo Failure | mail -s "Backup of /home has failed!" $admin
fi




