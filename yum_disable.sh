#!/bin/bash

# This script is meant to be used on Red Hat clusters that strictly rely on the internal repo
# built into their puppet master server. A simple use case are servers in private subnets 
# in a cloud environment that cannot not reach the internet. This will disable yum repos
# and change the file attribute to immutable so future puppet runs do not re-enable them. 

IP=`cat dr_ips.txt`

for i in $IP;
do
echo '------------------------------------------------------------';
echo "Connecting to $i";
echo ""
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 -o PasswordAuthentication=no $i "sudo yum-config-manager --disable internal-rhel7.repo.repo; sudo yum-config-manager --disable redhat-rhui-client-config; sudo yum-config-manager --disable redhat-rhui; sudo chattr +i /etc/yum.repos.d/internal-rhel7.repo.repo; sudo chattr +i /etc/yum.repos.d/redhat-rhui-client-config.repo; sudo chattr +i /etc/yum.repos.d/redhat-rhui.repo; sudo lsattr /etc/yum.repos.d/"
echo '------------------------------------------------------------';
echo "";
done;
