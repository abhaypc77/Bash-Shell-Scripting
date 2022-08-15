#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 number1 number2 number3" 
  exit 1
fi

a=$1
b=$2
c=$3

echo "First number = [$a]"
echo "Second number = [$b]"
echo "Third number = [$c]"
echo 

if [ $a -ge $b -a $a -ge $c ]; then
  echo "Greatest number = [$a]"

else 
  if [ $b -ge $a -a $b -ge $c ]; then
    echo "Greatest number = [$b]"

  else
     if [ $c -ge $a -a $c -ge $b ]; then
       echo "Greatest number = [$c]"
     fi
  fi   
fi

exit 0
