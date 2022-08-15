#!/bin/bash

cd /etc
for file in `ls`
do
  echo "file = $file"
  if [ $file = "passwd" ]; then
    echo "file = $file"
    while read line
    do
      user=`echo $line | cut -d : -f 1`
      echo "user=[$user]"
      if [ $user = "backup" ]; then
        shell=`echo $line | cut -d : -f 7`
        echo "shell of user[backup] = [$shell]" 
        break 2
      fi 
    done < $file
    #break
  fi
done
