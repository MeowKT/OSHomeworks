#!/bin/bash

ppid=0
sleepavg=0
count=0
ans=""
while read str
do
if [[ -n $str ]]
then
  newppid=$(echo $str | grep -E -s -o "Parent_ProcessID = [0-9]+" | grep -o "[0-9]\+")
  newsleepavg=$(echo $str | grep -E -s -o "Average_Running_Time = [0-9.]+" | grep -o "[0-9.]\+" | awk '{printf("%s",$1)}')
  if [[ $ppid == $newppid ]]
  then 
    sleepavg=$(echo "$sleepavg+$newsleepavg" | bc -l)
    count=$(echo "$count+1" | bc -l)
  else
    sleepavg=$(echo "$sleepavg/$count" | bc -l)
    ans=$ans"Average_Sleeping_Children_of_ParentID = "$ppid" is "$sleepavg$'\n'
    count=1
    sleepavg=$newsleepavg
    ppid=$newppid
  fi
  ans=$ans$str$'\n'
fi
done < ans4.txt
sleepavg=$(echo "$sleepavg/$count" | bc -l)
ans=$ans"Average_Sleeping_Children_of_ParentID = "$ppid" is "$sleepavg$'\n'
echo "$ans"


