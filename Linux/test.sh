#!/bin/bash

if [ -d ~/research ]
then
   echo "Directory is already made"
else
   mkdir research
fi 

if [ ! -f ~/research/sys_info.txt ]
then
   echo "File does not exist"
else
   rm ~/research/sys_info.txt
fi
