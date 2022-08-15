#!/bin/bash


cleanup ()
{
  echo "Removing temp file temp.$$" >> logs.txt
  rm temp.$$

}

trap 'echo "CTRL-C signal received...thus exiting...Task Not Completed" >> logs.txt; cleanup; exit 0' 2 
trap 'echo "Process is Killed by someone...Task Not Completed" >> logs.txt; cleanup; exit 0' 9 

if [ -f logs.txt ]; then
  rm logs.txt
fi


echo "Inside shell $0" >> logs.txt
echo "Creating temp file temp.$$" >> logs.txt
touch temp.$$

echo "Entering while loop, to process task" >> logs.txt

i=1
while [ $i -le 5 ]
do
  echo "Inside while, i = [$i]" | tee -a temp.$$
  sleep 1
  i=$((i+1))
done

echo "Comes out from while loop" >> logs.txt

cleanup

echo "Task completed successfully" >> logs.txt

exit 0
