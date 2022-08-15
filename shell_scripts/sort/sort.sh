UNSORTED_FILE=""
DEBUG_LOG_FILE="debug.log"


Usage()
{
  echo "Usage: sort -f <Unsorted_file>"
  echo "   -f  : Should be given with the file name ."
  exit 0
}


sort_data()
{
  echo "Reading file $UNSORTED_FILE "
  for i in `cat $UNSORTED_FILE`
    do
    echo "`echo $i | awk -F , '{ print "name="$1 "   " "percentage="$2}'`"
  done

  echo "Starting sorting of data"
  sort  $UNSORTED_FILE > $UNSORTED_FILE.sorted
  echo "Sorting of data completed ! "


  echo "Saved sorted data in file $UNSORTED_FILE.sorted"
  for i in `cat $UNSORTED_FILE.sorted`
    do
    echo "`echo $i | awk -F , '{ print "name="$1 "   " "percentage="$2}'`"
  done

  echo "Returing from method sort_data()"
}

###################################################################

  if [ $# -lt 2 ]; then
    Usage
  fi

  UNSORTED_FILE=$2

  echo "Starting sorting of data"
  echo "Calling method sort_data() with UNSORTED_FILE=$UNSORTED_FILE"
  echo "Processing....."
  sort_data
  echo "Sorting of data completed"


