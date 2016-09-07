#!/bin/bash

#This script will add your public key to ~/.ssh/authorized_keys on the specified remote server for key based authentication. 
#Before executing, make sure permissions are correct locally and on the remote server.
#'chmod 700 .ssh' and 'chmod 640 .ssh/authorized_keys'
#This script assumes you have already generated an ssh key pair on your local machine.

echo Please enter IP or hostname of remote host:
read host

#Replace user with your username
dir_check=`ssh nidesant@$host 'ls -al | grep .ssh'`
echo $dir_check

if [ -z $dir_check ]; then
  `ssh nidesant@$host 'mkdir -p .ssh; chmod 700 .ssh; cd .ssh/; touch authorized_keys; chmod 640 authorized_keys'`
  echo "Directory .ssh and authorized_keys file have been created!"
else
  echo "~/.ssh/authorized_keys already exists. You will be prompted once more for your password and your key will be uploaded!"
fi

`cat ~/.ssh/id_rsa.pub | ssh nidesant@$host 'cat >> .ssh/authorized_keys'`
echo "Your public key has been added to the remote server!"



