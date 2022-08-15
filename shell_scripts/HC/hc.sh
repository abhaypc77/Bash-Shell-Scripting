#!/bin/bash

CPU_THRESHOLD=85;
LOAD_THRESHOLD=1.0;
DISK_THRESHOLD=50;
ERROR_THRESHOLD=22:00;


check_cpu ()
{
CPU_IDLE=`vmstat | tail -1 | awk '{print $15 }'`;
CPU_UTILIZATION=`echo "100-$CPU_IDLE" | bc`;
if [ $CPU_UTILIZATION -gt  $CPU_THRESHOLD ]; then
  echo "CPU_Utilization : $CPU_UTILIZATION#";
else
  echo "CPU_Utilization : OK#" ;
fi
}

check_load ()
{
local LOAD=0 
LOAD=`uptime |  awk '{ print $NF }'`;
if [ $(echo "$LOAD > $LOAD_THRESHOLD" | bc) -ne 0 ]; then
  echo "Load_Average    : $LOAD#" ;
else
  echo "Load_Average    : OK#" ;
fi
}


check_disk ()
{
df -h > temp.$$
sed -i '1d' temp.$$

while read line 
do
  use=`echo $line | awk '{print $5}' | sed 's/%//'`
  if [ $use -gt $DISK_THRESHOLD ]; then
    DISK_UTILIZATION+="$line----"
  fi
done < temp.$$

rm temp.$$

if [ "$DISK_UTILIZATION" != "" ]; then
  echo "Disk_Utilzation : $DISK_UTILIZATION#" ;
else
  echo "Disk_Utilzation : OK#" ;
fi
}


check_errors ()
{
ERROR_TIME=`TZ=GMT+$ERROR_THRESHOLD date +%m%d%H%M%y`;
#echo $ERROR_TIME;
CURRENT_ERRORS=`errpt -s $ERROR_TIME | grep -v IDENTIFIER | awk '{$1=$2=$3=$4="";print}'| awk '{printf "%s""-----",$0}'`
#echo $CURRENT_ERRORS;
if [ "$CURRENT_ERRORS" != "" ]
then
echo "System_Errors   :$CURRENT_ERRORS#" ;
else
echo "System_Errors   : OK#" ;
fi
}

check_recent_reboot ()
{
RECENT_REBOOT=`uptime | grep -i days`;
if [ "$RECENT_REBOOT" == "" ]
then
echo "Recent_Reboot   : System_was_rebooted_recently#";
else
echo "Recent_Reboot   : OK#";
fi
}


#######################################MAIN

check_load;
check_recent_reboot;         
check_cpu;
check_disk;
#check_errors;
echo "Output from `uname -n` at `date`";
