#!/bin/bash
ps -A -o pid,cmd | awk '{print $1 " " $2}' | grep '/sbin' | awk '{print $1}'> ans.txt

