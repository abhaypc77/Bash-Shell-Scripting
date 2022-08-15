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

if [ $a -ge $b -a $a -ge $c ]; then
  echo "Greatest number = [$a]"

elif [ $b -ge $a -a $b -ge $c ]; then
  echo "Greatest number = [$b]"

elif [ $c -ge $a -a $c -ge $b ]; then
  echo "Greatest number = [$c]"

fi

exit 0
