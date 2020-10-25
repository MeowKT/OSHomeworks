#!/bin/bash

pid=0
ans=0
s=""
for pid in $(ps -Ao pid | tail -n +2)
do
  cur=$(cat -s "/proc/$pid/status" 2>/dev/null | grep -i VMSIZE | awk '{print $2}')
  if [[ $cur != "" ]]
  then
    s=$s$pid\ $cur$'\n'
  fi
done
echo "$s" | sort -r -n -k2 | head -n 1 | awk '{print $1}'
