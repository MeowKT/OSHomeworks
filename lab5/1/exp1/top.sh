#!/bin/bash

(test -e top.log || touch top.log) && > top.log

while (true);
do
  top -b -o %MEM -d 1 | head -12 | tail -9 >> top.log
  echo >> top.log
  sleep 2
done
