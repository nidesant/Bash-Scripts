#!/bin/bash

#This script will add your public key to ~/.ssh/authorized_keys on the specified remote server for key based authentication. 
#Script will check if .ssh directory and authorized_keys file exists on the remote server.
#It will also set correct permissions locally and  on the remote server i.e. 'chmod 700 .ssh' and 'chmod 640 .ssh/authorized_keys'
#This script assumes you have already generated an ssh key pair on your local machine and that your user and password have been
#generated on the remote server.

#id_rsa.pub might also be named authorized_keys depending on your configuration or how you generated your key pair
chmod 700 ~/.ssh; chmod 640 ~/.ssh/id_rsa.pub

echo Please enter IP or hostname of remote host:
read host

echo Please enter your username:
read username

dir_check=`ssh $username@$host 'cd .ssh; ls -al | grep authorized_keys'`

if [ -z "$dir_check" ]; then
  echo ".ssh directory or authorized_keys file doesn't appear to be present. Re-enter your password for directory and/or file to be created."
  `ssh $username@$host 'mkdir -p .ssh; chmod 700 .ssh; cd .ssh/; touch authorized_keys; chmod 640 authorized_keys'`
  echo "Directory .ssh and authorized_keys file have been created!"
  echo "Please re-enter your password one more time for your key to be uploaded!"
else
  echo "~/.ssh/authorized_keys already exists. You will be prompted once more for your password and your key will be uploaded!"
fi

`cat ~/.ssh/id_rsa.pub | ssh $username@$host 'cat >> .ssh/authorized_keys'`
echo "Your public key has been added to the remote server! You should now be able to login without a password!"
