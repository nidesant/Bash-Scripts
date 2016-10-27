#!/bin/bash

# Meant to automate starting or stopping of servies in large
# scale clusters or environments.
 
IP=`cat ips.txt`

echo "Please enter a service:"
read service

for i in $IP; do

  
