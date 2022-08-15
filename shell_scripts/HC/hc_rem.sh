#!/bin/bash

if [ -f hc.logs ]; then
  rm hc.logs
fi


for SERVER in `cat servers.txt`
do
  SERVER_IP=`echo $SERVER | cut -f 1 -d : `
  SERVER_NAME=`echo $SERVER | cut -f 2 -d : `
  echo "====================================================" | tee -a hc.logs
  echo "Server_Name     : $SERVER_NAME#" | tee -a  hc.logs;
  ping -c 1 $SERVER_IP > /dev/null

  if [ $? -eq 0 ]; then
    echo "Ping_Test       : OK#" | tee -a hc.logs
    ssh $SERVER_IP 'bash -s' < hc.sh | tee -a hc.logs
  else
    echo "Ping_Test       : FAIL#" | tee -a hc.logs
    echo "Load_Average    : NA#" | tee -a hc.logs
    echo "Recent_Reboot   : NA#" | tee -a hc.logs
    echo "CPU_Utilization : NA#" | tee -a hc.logs
    echo "Disk_Utilzation : NA#" | tee -a hc.logs
    echo "System_Errors   : NA#" | tee -a hc.logs
  fi

  echo "====================================================" | tee -a hc.logs 
  echo " "  | tee -a hc.logs;
  echo " "  | tee -a hc.logs;
  #read INPUT;
  #echo ;
done


#. hc_xls.sh
#. hc_mail.sh









