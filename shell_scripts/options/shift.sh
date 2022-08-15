#!/bin/bash

usage ()
{
  echo "Usage: $0"
  echo "       -i|--input  : Input File"
  echo "       -o|--output : Output File"
  echo "       -c|--conf   : Conf File"
  echo "       -l|--log    : Log File"
  echo "       -h|--help   : Display help"
  echo "       -v|--verbose: To Enable Verbose mode"
  exit 1
}


VERBOSE=0

while [ $# -ge 1 ]
do
opt="$1"

  case $opt in
    -i|--input)
    IN_FILE="$2"
    shift 2 
    ;;
    -o|--output)
    OUT_FILE="$2"
    shift 2
    ;;
    -c|--conf)
    CONF_FILE="$2"
    shift 2
    ;;
    -l|--log)
    LOG_FILE="$2"
    shift 2
    ;;
    -v|--verbose)
    VERBOSE=1
    shift
    ;;
    -h|--help)
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



