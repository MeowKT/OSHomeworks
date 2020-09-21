#!/bin/bash

function max {
if [[ $1 -gt $2 ]]
then
echo $(( $1 ))
else
echo $(( $2 ))
fi
}
if [[ $# -eq 3 ]];
then
  ans=$(max $(max $1 $2) $3)
  echo $ans
else
  echo "Usage: 1.sh a b c"
fi

