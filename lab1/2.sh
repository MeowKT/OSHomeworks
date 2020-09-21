#!/bin/bash

ans=""
while true
do
  read tmp
  if [[ $tmp == "q" ]];
  then
    break
  fi
  ans=$ans$tmp
done
echo $ans