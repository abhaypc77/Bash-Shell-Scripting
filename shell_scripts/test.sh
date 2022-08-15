#!/bin/bash
# this is script 
a=$1
b=$2
c=$3
echo "first number is : $a"
echo "Second Number is : $b"
echo "third number is : $c"

sum=`echo "$a+$b+$c" | bc`
echo "sum value is : $sum"
exit 3
