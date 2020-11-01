#!/bin/bash
TYPE="+"
value=1
(tail -f pipe) | while true; do
	read LINE;
	case $LINE in
		"QUIT")
			echo "stop"
			kill $(cat .pid)
			exit 0
			;;
		"+"|"*")
			TYPE="$LINE"
			;;
		*)
			if [[ $LINE =~ -?[0-9]+ ]]; then
				
				let value=$value$TYPE$LINE
				echo "$value"
			else
				echo "incorrect number"
				kill -USR1 $(cat .pid)
				exit 1
			fi
			;;
esac
done

