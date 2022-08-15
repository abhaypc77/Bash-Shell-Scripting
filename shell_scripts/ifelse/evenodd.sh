#!/bin/bash

x=$1

rem=`expr $x % 2`

if [ $rem -eq 0 ]; then
  echo "Number is Even"
else
  echo "Number is Odd"
fi

exit 0

