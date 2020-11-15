#!/bin/bash

min_day=$(date -d -7day +%Y-%m-%d)
cur_day=$(date +%Y-%m-%d)
last_backup=$(ls ~ | grep -E "Backup\-[0-9]{4}\-[0-9]{2}\-[0-9]{2}$" | sort | tail -n 1)
if [[ $last_backup < Backup-$min_day ]]; then
	cur_backup=Backup-$cur_day
	mkdir ~$cur_backup 2> /dev/null
else
	cur_backup=$last_backup
fi 

echo "$cur_backup $cur_day" >> ~/backup-report
for file in $(ls ~/source); do
	if [[ -f ~/$cur_backup/$file ]]; then
		size1=$(stat -c %s ~/$cur_backup/$file) 
		size2=$(stat -c %s ~/source/$file)
		if [[ $size1 = $size2  ]]; then
			  continue;
		fi	
		echo "? $file $file.$cur_day" >> ~/backup-report
		cp ~/$cur_backup/$file ~/$cur_backup/$file.$cur_day
	fi
	cp ~/source/$file ~/$cur_backup/$file	
	echo "+ $file" >> ~/backup-report
done



