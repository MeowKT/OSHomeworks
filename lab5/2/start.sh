#!/bin/bash

for (( i = 0; i < 10; i++ ))
do
  ({
    ./newmem.sh 4090000
  }) &
done
