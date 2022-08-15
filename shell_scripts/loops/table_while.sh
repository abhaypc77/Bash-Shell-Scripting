#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 Table_Number Table_limit"
  exit
fi


table_no=$1

if [ $2 ]; then
  table_limit=$2
else
  table_limit=10
fi

i=1
while [ $i -le $table_limit ]
do
  result=`expr $table_no \* $i`
  echo "$table_no * $i = $result"
  i=`expr $i + 1`
done

