#!/bin/bash


if [ $# -ne 3 ]; then
  echo "Usage: $0 value1 operator value2"
  echo "       operator: + - * /"
  exit 1
fi

value1=$1
value2=$3
operator=$2

case $operator in
     +) result=`echo $value1 + $value2 | bc`
        ;;
     -) result=`echo $value1 - $value2 | bc`
        ;;
     \*) result=`echo $value1 \* $value2 | bc`
        ;;
     /) result=`echo $value1 / $value2 | bc`
        ;;
     *) echo "Invalid operator '$operator'"
	exit 1
esac

echo "result = [$result]"


