#!/bin/bash

cur_date=$(date +%s)
s=""
for i in $(ps -Ao pid | tail -n +2)
do
  if [[ ! -e "/proc/$i" ]] 
  then
  continue
  fi
  cur_pid_date=$(stat -c %z /proc/$i 2>/dev/null | awk '{print $1 "T" $2}')
  cur_pid_date_sec=$(date +%s -d $cur_pid_date)
  let dif=$(($cur_date-$cur_pid_date_sec))
  if [[ $dif -le 60 && $dif -ge 0 && $i -ne $$ ]] 
  then
     s=$s$i$'\n'
  fi
done
echo "$s"
s=""
for i in $(ps -Ao pid | tail -n +2)
do
  if [[ ! $i == "" && -f "/proc/$i/io" ]] 
  then
    mem=$(sudo cat "/proc/$i/io" | grep "rchar" | awk '{print $2}')
    s=$s$i\ $mem$'\n'
  fi
done
echo "$s" > tmp.txt
sleep 2
s=""
while read str 
do
  pid=$(echo $str | awk '{print $1}')
  if [[ ! $pid == "" && -f "/proc/$pid/io" ]] 
  then
    cmd=$(ps -p $pid o cmd | tail -n +2)
    mem=$(($(sudo cat "/proc/$pid/io" | grep "rchar" | awk '{print $2}')-$(echo $str | awk '{print $2}')))
    s=$s$pid\ $mem\ $cmd$'\n'
  fi
done < tmp.txt
echo "$s" | sort -r -n -k2 | head -3 | awk '{print $1,":",$3,":",$2}'
rm tmp.txt
