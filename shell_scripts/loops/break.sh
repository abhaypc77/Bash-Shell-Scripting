#!/bin/bash

i=0

while [ $i -le 10 ]
do
  i=$(($i+1))
  if [ $i -le 5 ]; then
    echo $i
    continue
  fi    
  echo "aaaaaaa"
  break
done
