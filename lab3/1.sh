#!/bin/bash

date=$(date '+%d.%m.%y_%H:%M:%S')
mkdir ~/test && echo "catalog test was created successfully" > ~/report.tmp && touch ~/test/$date.tmp
ping -c 1 www.net_nikogo.ru || echo $date" error with ping www.net_nikogo.ru" >> ~/report.tmp
