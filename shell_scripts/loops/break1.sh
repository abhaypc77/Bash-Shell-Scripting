#!/bin/bash


for i in 1 2 3 4 5 
do
  for j in 6 7 8 9 10
  do
    if [ $j -eq 9 ]; then
      break 2
     else 
       echo -n "$j "
    fi
  done
  echo ""
done
