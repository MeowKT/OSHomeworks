#!/bin/bash

ps -u savva -o pid,command | tail -n +2 | sed -r "s/\s*([0-9]+)\s(.+)/\1 : \2/" > ans.txt
