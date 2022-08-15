#!/bin/bash


log_file=file
#log_file=/home/backup/logfile

size=`ls -l $log_file | cut -d ' ' -f 5`

until [ $size -gt 1000 ]
do
  echo "Size is less"
  sleep 10
  size=`ls -l $log_file | cut -d ' ' -f 5`
done

echo "Size is greator, moving to new file"

date=`date +%s`
mv $file "$file-"$date.bak

