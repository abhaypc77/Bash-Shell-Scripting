#!/bin/bash

usage ()
{
  echo "Usage: $0 number1 number2 number3" 
  exit 1
}

max_two()
{
x=$1
y=$2
echo "First number = [$x]"
echo "Second number = [$y]"

if [ $x -ge $y ]; then
  return $x
else
  return $y
fi

}


max_three()
{
a=$1
b=$2
c=$3

echo "First number = [$a]"
echo "Second number = [$b]"
echo "Third number = [$c]"

if [ $a -ge $b -a $a -ge $c ]; then
  return $a
elif [ $b -ge $a -a $b -ge $c ]; then
  return $b
elif [ $c -ge $a -a $c -ge $b ]; then
  return $c
fi

}

##############################

if [ $# -lt 2 ]; then
  usage
else
  no1=$1
  no2=$2
  no3=$3
fi


if [ $# -eq 2 ]; then
  max_two $no1 $no2
  greator=$?
  echo "Gretest no = [$greator]"
else
  max_three $no1 $no2 $no3
  greator=$?
  echo "Greatest no = [$greator]"
fi




