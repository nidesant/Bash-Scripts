#!/bin/bash

of=messages-backup-$(date +%Y%m%d).tgz

cd /var/log/
tar -czvf $of messages
cp $of /home/user/
rm -rf $of


