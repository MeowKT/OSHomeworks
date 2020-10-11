#!/bin/bash
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
sleep 5
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

