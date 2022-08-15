#!/bin/bash

echo "Enter fisrt no."
read a
echo "Enter second no."
read b

c=`echo $(($a+$b))`
echo $"sum=$c"

c=`expr $a + $b`
echo "sum=$c"

c=`echo "$a + $b" | bc`
echo "sum=$c"
