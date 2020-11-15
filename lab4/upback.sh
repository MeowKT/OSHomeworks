#!/bin/bash
date_regex="[0-9]{4}\-[0-9]{2}\-[0-9]{2}$"
regex="Backup\-$date_regex"
last_backup=$(ls ~ | grep -E $regex | sort | tail -n 1)
mkdir ~/restore 2> /dev/null

for file in $(ls ~/$last_backup | grep -vE ".$date_regex$"); do
	cp ~/$last_backup/$file ~/restore/$file	
done



