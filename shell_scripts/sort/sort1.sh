UNSORTED_FILE=""
DEBUG_LOG_FILE="debug.log"
> $DEBUG_LOG_FILE

Usage()
{
  echo "Usage: sort -f <Unsorted_file>"
  echo "   -f  : Should be given with the file name ."
  exit 0
}


sort_data()
{
  echo "Reading file $UNSORTED_FILE " | tee -a  $DEBUG_LOG_FILE
  while read line
  do
    echo "`echo $line | awk -F , '{ print "name="$1 "   " "percentage="$2}'`" | tee -a  $DEBUG_LOG_FILE
  done < $UNSORTED_FILE

  echo "Starting sorting of data"
  sort  $UNSORTED_FILE > $UNSORTED_FILE.sorted
  echo "Sorting of data completed ! " | tee -a  $DEBUG_LOG_FILE


  echo "Saved sorted data in file $UNSORTED_FILE.sorted" | tee -a  $DEBUG_LOG_FILE
  while read line
  do
    echo "`echo $line | awk -F , '{ print "name="$1 "   " "percentage="$2}'`" | tee -a  $DEBUG_LOG_FILE
  done < $UNSORTED_FILE.sorted 

  echo "Returing from method sort_data()" | tee -a  $DEBUG_LOG_FILE
}

###################################################################

  if [ $# -lt 2 ];then
    Usage
  fi

  UNSORTED_FILE=$2
 
  if [ -f $UNSORTED_FILE ]; then
    echo "File to be sorted is  $UNSORTED_FILE"
  else
    echo "File '$UNSORTED_FILE' does not exits"
    exit -1
  fi  

  echo "Starting sorting of data"
  echo "Calling method sort_data() with UNSORTED_FILE=$UNSORTED_FILE" | tee -a  $DEBUG_LOG_FILE 
  echo "Processing....."
  sort_data
  echo "Sorting of data completed"


