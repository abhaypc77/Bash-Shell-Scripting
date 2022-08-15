#!/bin/bash

value=$1

case $value in
    1) echo "one" 
       ;;
    2) echo "two"
       ;;
    3) echo "three" 
       ;;
    4) echo "four" 
       ;;
    5) echo "five" 
       ;;
    *) echo "wrong input" 
       ;;
esac

