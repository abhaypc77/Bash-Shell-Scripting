#!/bin/bash


for file in `ls`
do
  echo "File = $file"
  if [ $file == "continue.sh" -o $file == "data" ]; then
   continue
  fi

  echo "removing file : $file"
  rm $file

done 

