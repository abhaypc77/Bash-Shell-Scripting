#!/bin/bash


trap 'echo "CTRL-C signal received..."; exit 0' 2 


while true
do
  echo "Inside while"
  sleep 1
done

exit 0
