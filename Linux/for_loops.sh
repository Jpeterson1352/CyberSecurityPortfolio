#!/bin/bash

states=("Nebraska" "Hawaii" "California" "Illinois" "Michigan")
nums=(1 2 3 4 5 6 7 8 9)
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2>/dev/null)


for state in ${states[*]}; do
   #echo $state
   if [ $state == "Hawaii" ]
   then
       echo "Hawaii is the best!"
   else
       echo "I'm not fond of Hawaii"
   fi
done

for num in ${nums[*]}; do
   if [ $num  = 3 ] || [ $num = 5 ] || [ $num = 7 ]
   then
      echo $num
   fi
done

for x in ${ls_out[@]}; do
  echo $x
done

for exec in ${execs[@]}; do
  echo $exec

done
