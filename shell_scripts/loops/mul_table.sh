#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 Table_Number Table_limit"
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]; then
  table_no=$1
else
  echo "Error: Table Number should be integer"
  exit
fi

if [ $2 ]; then
  table_limit=$2
else
  table_limit=10
fi

i=1
while [ $i -le $table_limit ]
do
  echo "$table_no * $i = $(($table_no * i))"
  i=$((i + 1))
done

exit 0
