#!/bin/bash

ans=""
for pid in $(ps -A -o pid | tail -n +2) 
do
file1="/proc/"$pid"/status"
file2="/proc/"$pid"/sched"
ppid=$(grep -E -s -i "ppid:\s(.+)" $file1 | awk '{print $2}')
sum_exec_runtime=$(grep -E -s -i "(se\.sum_exec_runtime.+)" $file2 | awk '{print $3}')
nr_switches=$(grep -E -s -i "(nr_switches.+)" $file2 | awk '{print $3}')
if [[ $nr_switches -eq 0 ]]
then continue
fi
average_running_time=`echo $sum_exec_runtime / $nr_switches | bc -l`
if [[ $ppid != "" ]]
then ans=$ans"ProcessID = "$pid" : Parent_ProcessID = "$ppid" : Average_Running_Time = "$average_running_time$'\n'
fi
done
echo "$ans" | sort -n -k7 > ans4.txt
