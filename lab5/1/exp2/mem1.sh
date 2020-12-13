#!/bin/bash

(test -e report1.log || touch report1.log) && > report1.log

array=()
let count=0
let size=0

while :; do
  array+=(1 2 3 4 5 6 7 8 9 10)
  count=$(( $count+1 ))
  size=$(( $size+10 ))
  if [[ "$count" -eq 10000 ]]; then 
    echo $size >> report1.log
    count=0
  fi
done	
