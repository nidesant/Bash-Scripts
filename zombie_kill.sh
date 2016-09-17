#!/bin/bash

#Will kill all zombie proccesses by sending SIGCHLD signal to parent process to execute wait() system call. 
#If the parent process ignores the SIGCHLD signal, the parent process will be killed and restarted.
#Note that if the parent PID is init (1), the process cannot be killed. 

ps -elf | awk '{print $2 " " $4 " " $5}'

