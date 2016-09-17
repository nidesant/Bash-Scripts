#!/bin/bash

#Will kill all zombie proccesses by sending SIGCHLD signal to parent process to execute wait() system call. 
#If the parent process ignores the SIGCHLD signal, the parent process will be killed and restarted.
#Note that if the parent PID is init (1), the process cannot be killed. 

<<<<<<< HEAD
ps -elf | awk '{print $2 " " $4 " " $5}'

=======
z=`ps aux | awk '{print $2 " " $8}' | grep 'Z'`
>>>>>>> a6a97dd9dd60ffd435e5a0c56153d921e54b94fa
