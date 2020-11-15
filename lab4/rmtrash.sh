#!/bin/bash

script_name=$1
home_trash=$HOME/.trash
home_log=$HOME/trash.log
if [ ! -d $home_trash ]; then :
  mkdir $home_trash
fi
current_trash_file=$(ls $HOME/.trash | sort -n | tail -1)
current_trash_file=$((current_trash_file+1))
ln $script_name "$home_trash/$current_trash_file"
rm $script_name
if [ ! -e $home_trash ];  then :
  touch $home_log
fi
echo "$PWD/$script_name:$current_trash_file" >> $home_log
