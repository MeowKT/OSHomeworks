#!/bin/bash
echo $$ > .pid

usr1()
{
  echo 'incorrect number'
  exit 1
}

sigterm()
{
  echo 'stop'
  exit 0
}

trap 'usr1' USR1
trap 'sigterm' SIGTERM
while true; do
  read LINE
  echo "$LINE" > pipe
	
done

