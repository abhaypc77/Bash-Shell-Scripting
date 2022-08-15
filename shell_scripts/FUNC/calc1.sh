#!/bin/bash

usage()
{
  echo "Usage: $0 value1 operator value2"
  echo "       operator: + - * /"
  exit 1
}


add()
{
local a=$1
local b=$2
echo "Adding $a and $b"
result=`echo "$a + $b" | bc`
return 0
}


subtract()
{
local a=$1
local b=$2
echo "Subtracting $a and $b"
result=`echo "$a - $b" | bc`
return 0
}


multiply()
{
local a=$1
local b=$2
echo "Multiplying $a and $b"
result=`echo "$a * $b" | bc`
return 0
}


divide()
{
local a=$1
local b=$2
echo "Dividing $a and $b"
result=`echo "$a / $b" | bc`
return 0
}

########################################

if [ $# -ne 3 ]; then
  usage
fi

value1=$1
value2=$3
operator=$2

case $operator in
     +) add $value1 $value2
        if [ $? -ne 0 ]; then 
          echo "Error in getting sum"
          exit 1
        fi 
        ;;
     -) subtract $value1 $value2
        if [ $? -ne 0 ]; then 
          echo "Error in getting subtraction"
          exit 1
        fi 
        ;;
     \*)multiply $value1 $value2 
        if [ $? -ne 0 ]; then 
          echo "Error in Multiplication"
          exit 1
        fi 
        ;;
     /) divide $value1 $value2
        if [ $? -ne 0 ]; then 
          echo "Error in Division"
          exit 1
        fi 
        ;;
     *) echo "Error: Invalid operator '$operator'"
	usage
esac

echo "Result = [$result]"

exit 0


