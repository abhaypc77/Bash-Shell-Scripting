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


for (( i=1; i<=$table_limit; i++))
do
  echo "$table_no * $i = $(($table_no * i))"
done

