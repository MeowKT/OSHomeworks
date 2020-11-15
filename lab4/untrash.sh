#!/bin/bash

file_path=$HOME/OSHomeworks/lab4/$1
for i in $(grep -h "$file_path:[0-9]*" $HOME/trash.log)
do
  num_in_trash=$(echo $i | awk -F ":" '{print $2}') 
  file_path_in_trash=$HOME/.trash/$num_in_trash
  if [ ! -e $file_path_in_trash ]; then 
    continue
  fi
  echo "Do you want to restore file - $file_path? (Y/N)"
  read answer
  if [[ $answer == "Y" ]]
  then
    if [ -d $(dirname $file_path) ]
    then
        if [[ -e $file_path ]]
        then
          echo "You already have file with this name. Type other name: "
          read name  
          ln "$file_path_in_trash" "$(dirname $file_path)/$name"
        else
          ln $file_path_in_trash $file_path
        fi
    else
      echo "There is no directory $(dirname $file_path)"
      ln $file_path_in_trash $HOME/$1
    fi
    rm $file_path_in_trash
    grep -v "$file_path:$num_in_trash" $HOME/trash.log > $HOME/trash0.log
    mv $HOME/trash0.log $HOME/trash.log
fi
done
