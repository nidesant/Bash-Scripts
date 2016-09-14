#!/bin/bash

z=`ps aux | awk '{print $2 " " $8}' | grep 'Z'
