#!/bin/bash

func1 ()
{
local x=5
echo "value of x in func1 = [$x]"

}

func2 ()
{
local x=10
echo "value of x in func2 = [$x]"
}



################
x=1
echo "value of x in main = [$x]"

x=$((x+1))
echo "value of x in main = [$x]"

func1

x=$((x+1))
echo "value of x in main = [$x]"

func2
 
exit 5
