#!/bin/bash

cmd1="ip addr | grep inet | tail -2 | head -1"
cmd2="sudo find /home -type f -perm 777"
temp=null
output=$HOME/research/sys_info.txt

if [ "$EUID" -neq 0 ]
then
   echo "ERROR RUN COMMAND AS SUDO"
   exit -1
fi

if [ -d ~/research ]
then
   :
else
   mkdir ~/research 2>/dev/null
fi

if [ ! -f ~/research/sys_info.txt ]
then
   :
else
   rm ~/research/sys_info.txt -f
fi

echo "A Quick System Audit Script" >>$output
date >>$output
echo "" >>$output
echo "Machine Type Info:" >>$output
echo -e "$MACHTYPE \n" >>$output
echo -e "Uname info: $(uname -a) \n" >>$output
echo -e "IP Info:" >>$output
echo -e "$cmd1 \n" >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nexec Files:" >>$output
echo $cmd2 >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >>$output
