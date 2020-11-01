#!/bin/bash
cat /dev/null > .pid

nice -n 1 ./4_1.sh&
nice -n 2 ./4_1.sh&
nice -n 3 ./4_1.sh&

sleep 5
sudo cpulimit -b -p $(cat .pid | head -n 1) --limit=10 2>/dev/null >/dev/null
kill $(cat .pid | tail -n 1) 




