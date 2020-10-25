#!/bin/bash
ps -A -o pid,stime | tail -1 | awk '{print $1}'
# ps -A -o pid,stime | tail -n +2 | sort -k2 | tail -1 | awk '{print $1}'

