#!/bin/bash
echo $$ > .pid
value="1"

sigsum()
{
	let value=$value+2
	echo "$value"
}

sigmul()
{
	let value=$value*2
	echo "$value"
}

sigterm()
{
	echo "stop"
	exit
}

trap 'sigterm' SIGTERM
trap 'sigsum' USR1
trap 'sigmul' USR2
while true; do
	echo "" > /dev/null
done

