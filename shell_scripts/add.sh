#!/bin/bash

echo "First num is = $1"

echo "Second num is = $2"


sum=`echo "$1 + $2" | bc`

echo "Sum = $sum"


exit 5
