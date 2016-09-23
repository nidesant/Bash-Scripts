#!/bin/bash

#Will kill all zombie proccesses by sending SIGCHLD signal to parent process to execute wait() system call. 
#If the parent process ignores the SIGCHLD signal, the parent process will be killed.
#Note that if the parent PID is init or systemd (1), the process cannot be killed. 

z=`ps -elf | awk '{print $2 " " $4 " " $5}' | tail -n +2 | grep 'Z'`
k=$(echo $z | awk '{print $3}')

if [[ -z $z ]]; then
  echo "There are currently no zombie processes!"
else
  echo "Zombies found, trying to kill zombies!"
if [ "$k" == 1 ]; then
  echo "PPID is 1 (init or systemd), and cannot be killed. If necessary, reboot the server."
else
  kill -s SIGCHLD $k
  echo "Sending SIGCHLD signal to parent process..."
fi
if [[ -z $k ]]; then
  echo "Zombies have been killed!"
else
    echo "Parent process ignored the signal, killing parent process!"
    kill -9 $k
fi
fi
