#!/bin/bash

UNSORTED_FILE=""
SORTED_FILE=""
DEBUG_FLAG=0;
DEBUG_LOG_FILE=""


usage()
{
  echo "Usage: shell_sort_tutorial -u <Unsorted_file> -s <sorted file> -l <log file> -D <debug level>"
  echo "   -u  : Unsorted file which is to be sorted."
  echo "   -s  : Sorted file after sorting the data."
  echo "   -l  : log file which contains log."
  echo "   -d  : Optional parameter to enable debug log by specifying debug level 0 mean debug off. 1 and 2 are debug level for debug on."
  exit 0
}



logger()
{
  if [ $DEBUG_FLAG -eq 0 ]; then
    return;
  fi

  size=`ls -l $DEBUG_LOG_FILE | cut -d ' ' -f 5`
  if [ $size -gt 100000000 ]; then
    date=`date +%Y%m%d_%H%M%S`
    mv $DEBUG_LOG_FILE  $DEBUG_LOG_FILE.$date
  fi 
  
  echo "`date`|$0|$*" >> $DEBUG_LOG_FILE
}

sort_data()
{
  if [ $DEBUG_FLAG -eq 1 ]; then
    logger "Reading file $UNSORTED_FILE"
  fi

  if [ $DEBUG_FLAG -eq 2 ]; then
    logger "Reading file $UNSORTED_FILE "
    for i in `cat $UNSORTED_FILE`
      do
      logger "`echo $i | awk -F , '{ print "name="$1 "   " "percentage="$2}'`"
    done
  fi

  logger "Sorting file"
  sort   $UNSORTED_FILE > $UNSORTED_FILE.sorted
  logger "Sorting of data completed ! "

  if [ $DEBUG_FLAG -eq 1 ]; then
    logger "Saved sorted data in file $UNSORTED_FILE.sorted"
  fi

  if [ $DEBUG_FLAG -eq 2 ]; then
    logger "Saved sorted data in file $UNSORTED_FILE.sorted"
    for i in `cat $UNSORTED_FILE.sorted`
      do
      logger "`echo $i | awk -F , '{ print "name="$1 "   " "percentage="$2}'`"
    done
  fi

  logger "Returning from method sort_data()"
}
###################################################################

  
while [ $# -ge 1 ]
do
opt="$1"

  case $opt in
    -u)
    UNSORTED_FILE="$2"
    shift 2 
    ;;
    -s)
    SORTED_FILE="$2"
    shift 2
    ;;
    -l)
    DEBUG_LOG_FILE="$2"
    shift 2
    ;;
    -d)
    DEBUG_FLAG="$2"
    shift 2
    ;;
    -h|--help)
    usage 
    ;; 
    *)
    usage
    ;;
  esac
done

if [ ! "$UNSORTED_FILE" ]; then
  echo "Error: Unsorted file must be given."
  usage
elif [ ! -f "$UNSORTED_FILE" ]; then
  echo "Error: $UNSORTED_FILE does not exist"
  exit 1	 
fi	

if [ ! "$SORTED_FILE" ]; then
  SORTED_FILE=$UNSORTED_FILE.sorted
fi	

if [ "$DEBUG_LOG_FILE"  -a ! $DEBUG_FLAG ]; then
  DEBUG_FLAG=1
fi	

if [ $DEBUG_FLAG -a ! "$DEBUG_LOG_FILE" ]; then
  DEBUG_LOG_FILE=sort.log
fi

if [ ! -f $DEBUG_LOG_FILE ]; then
  touch $DEBUG_LOG_FILE 
  logger "*********Debug for Sort*********"
fi  

logger "*********Starting**********"
echo "Starting sorting of data"
logger "Calling method sort_data() with UNSORTED_FILE=$UNSORTED_FILE, DEBUG_FLAG=$DEBUG_FLAG"
echo "Processing....."
sort_data 
echo "Sorting of data completed"

logger "*********Exiting**********"


exit 0
  
