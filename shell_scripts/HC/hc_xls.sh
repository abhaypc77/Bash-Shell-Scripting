#!/bin/bash

if [ -f hc.xls ]; then
  rm hc.xls
fi

cp hc.logs temp.$$

echo "SERVER_LIST# PING_TEST# LOAD# REBOOT_STATUS# CPU_UTILIZATION# DISK_UTILIZATION# CURRENT_ERRORS#" | tee -a hc.xls

sed -i '1d' temp.$$
for i in `cat servers.txt`
do
  head -6 temp.$$ | awk '{print $3}' |  awk '{printf "%s"" ",$0}' | tee -a  hc.xls
  echo "" | tee -a hc.xls
  sed -i '1,+10d' temp.$$
done 

rm temp.$$

