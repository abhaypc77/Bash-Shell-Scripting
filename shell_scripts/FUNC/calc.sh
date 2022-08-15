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
local sum=`echo "$a + $b" | bc`
return $sum
}


subtract()
{
local a=$1
local b=$2
echo "Subtracting $a and $b"
local sub=`echo "$a - $b" | bc`
return $sub
}


multiply()
{
local a=$1
local b=$2
echo "Multiplying $a and $b"
local mul=`echo "$a * $b" | bc`
return $mul
}


divide()
{
local a=$1
local b=$2
echo "Dividing $a and $b"
local div=`echo "$a / $b" | bc`
return $div
}

#########################main

if [ $# -ne 3 ]; then
  usage
fi

value1=$1
value2=$3
operator=$2

case $operator in
     +) add $value1 $value2
        result=$?
        ;;
     -) subtract $value1 $value2
        result=$?
        ;;
     \*)multiply $value1 $value2 
        result=$?
        ;;
     /) divide $value1 $value2
        result=$?
        ;;
     *) echo "Error: Invalid operator '$operator'"
	usage
esac

echo "Result = [$result]"

