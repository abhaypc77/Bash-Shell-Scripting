#!/bin/bash

usage ()
{
  echo "Usage: $0"
  echo "       -i : Input File"
  echo "       -o : Output File"
  echo "       -c : Conf File"
  echo "       -l : Log File"
  echo "       -h : Display help"
  echo "       -v : To Enable Verbose mode"
  exit 1
}


VERBOSE=0

while getopts "i:o:c:l:vh" opt;
do
  case $opt in
    i)
    IN_FILE="$OPTARG"
    ;;
    o)
    OUT_FILE="$OPTARG"
    ;;
    c)
    CONF_FILE="$OPTARG"
    ;;
    l)
    LOG_FILE="$OPTARG"
    ;;
    v)
    VERBOSE=1
    ;;
    h)
    usage 
    ;; 
    *)
    usage
    ;;
  esac
done

echo "Input File = [$IN_FILE]"
echo "Out File = [$OUT_FILE]"
echo "Conf File = [$CONF_FILE]"
echo "Log File = [$LOG_FILE]"
echo "Verbose mode = [$VERBOSE]"



