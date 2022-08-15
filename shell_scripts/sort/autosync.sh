#!/bin/bash

#autocodesync.sh Ver1.0
#Shell to Auto Sync and Build Android code and Vowifi code
#As users have access only to their HOME directory, this SHELL accepts all paths relative to user's HOME directory
#Suggestions and Feedback @Abhay


DEBUG=1;
ANDROID_DIR=""
VOWIFI_DIR=""
DEBUG_FILE=""
LOG_PATH=$HOME
LOG_DIR="codesync"
LUNCH="sp9850ka_1h10_reliance-userdebug-native"


usage()
{
  echo "Usage: $0 -b <branch path> -l <lunch option> -v <vowifi path> -L <log file> -d <debug level>"
  echo "   -b|--branch: Branch to be updated."
  echo "   -l|--lunch : Lunch option for the build."
  echo "   -v|--vowifi: Build vowifi native Modules."
  echo "   -L|--log   : Log file which contains code update logs."
  echo "   -d|--debug : Optional parameter, 0: No Logs, 1: Important Logs, 2: All Logs."
  echo "   -h|--help  : Display Help."
  exit 0
}


logger()
{
  [ $DEBUG -eq 0 ] && return

  echo "`date`|$0|$*" >> $LOG_PATH/$LOG_DIR/$DEBUG_FILE
}


codesync_init()
{
  if [ ! -d $LOG_PATH/$LOG_DIR ]; then
    mkdir $LOG_PATH/$LOG_DIR
    if [ $? -eq 0 ]; then
      echo "Created directory codesync."
    else
      echo "Error: Unable to create directory codesync."
      exit 1
    fi 
  fi

  if [ -f $LOG_PATH/$LOG_DIR/$DEBUG_FILE ]; then
    rm $LOG_PATH/$LOG_DIR/$DEBUG_FILE
  fi
  touch $LOG_PATH/$LOG_DIR/$DEBUG_FILE 
  logger "Debug File for CodeAutoSync"
}


sync_android()
{
  logger "Starting Android sync for Branch : $ANDROID_DIR"
  cd $HOME/$ANDROID_DIR

  if [ $DEBUG -eq 2 ]; then
    repo sync -c -d -q  2>$LOG_PATH/$LOG_DIR/reposync.log
  else
    repo sync -c -d -q
  fi 

  if [ $? -eq 0 ]; then
    logger "Android sync completed."
  else
    logger "Error: Android sync failed."
    exit 2
  fi
}


build_android()
{
  local lunch_opt=$1
  cd $ANDROID_DIR
  
  source build/envsetup.sh
  lunch $lunch_opt

  kheader
  if [$? -ne 0 ]; then
    logger "Error: Android Build Failed."
    exit 3
  fi 

  if [ $DEBUG -eq 2 ]; then
    make -j >> $LOG_PATH/$LOG_DIR/$LUNCH_build.log
  else
    make -j 
  fi

  if [$? -ne 0 ]; then
    logger "Error: Android Build Failed."
    exit 3
  fi 
}


sync_avatar()
{
  cd $HOME/$VOWIFI_DIR

  if [ ! -d avatar ]; then
    logger "Error: Cannot not update avatar. Module does not exist."
    return 1
  fi

  cd avatar 
  git pull

  if [ $? -eq 0 ]; then
    logger "Avatar updated successfully."
    return 0
  else
    logger "Error: Avatar Update Failed."
    return 1
  fi  
}


sync_lemon()
{
  cd $HOME/$VOWIFI_DIR

  if [ ! -d lemon ]; then
    logger "Error: Cannot not update lemon. Module does not exist."
    return 1
  fi

  cd lemon 
  git pull

  if [ $? -eq 0 ]; then
    logger "Lemon updated successfully."
    return 0
  else
    logger "Lemon update Failed."
    return 1
  fi  
}


build_avatar()
{
  cd $HOME/$ANDROID_DIR/$VOWIFI_DIR

  if [ ! -d avatar ]; then
    logger "Error: Cannot not Build avatar. Module does not exist."
    return 1
  fi

  cd avatar 
  mm

  if [ $? -eq 0 ]; then
    logger "Avatar Build successfully."
    return 0
  else
    logger "Error: Avatar Build Failed."
    return 1
  fi  
}


build_lemon()
{
  cd $HOME/$ANDROID_DIR/$VOWIFI_DIR

  if [ ! -d lemon ]; then
    logger "Error: Cannot not Build Lemon. Module does not exist."
    return 1
  fi

  cd lemon 
  mm

  if [ $? -eq 0 ]; then
    logger "Lemon Build successfully."
    return 0
  else
    logger "Error: Lemon Build Failed."
    return 1
  fi  
}


###################### MAIN ############################

  
while [ $# -ge 1 ]
do
opt="$1"

  case $opt in
    -b|--branch)
    ANDROID_DIR="$2"
    shift 2 
    ;;
    -l|--lunch)
    LUNCH="$2"
    shift 2 
    ;;
    -v|--vowifi)
    VOWIFI_DIR="$2"
    shift 2 
    ;;
    -L|--log)
    DEBUG_FILE="$2"
    shift 2
    ;;
    -d)
    DEBUG="$2"
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

if [ ! "$ANDROID_DIR" ]; then
  echo "Error: Code Branch Required."
  usage
elif [ ! -d $HOME/$ANDROID_DIR ]; then
  echo "Error: Code Branch [$ANDROID_DIR] does not exits."
  exit 1
fi	

if [ "$DEBUG_FILE" -a ! $DEBUG ]; then
  DEBUG=1
fi	

if [ $DEBUG -a ! "$DEBUG_FILE" ]; then
  DEBUG_FILE="codesync.log"
fi

codesync_init

sync_android
build_android $LUNCH

if [ $VOWIFI_DIR ]; then
  sync_avatar
  if [ $? -eq 0 ]; 
    avatar_flag=1
  fi

  sync_lemon 
  if [ $? -eq 0 ]; 
    lemon_flag=1
  fi

  if [ $avatar_flag -eq 1 -a $lemon_flag -eq 1 ]; then
    mv $HOME/$VOWIFI_DIR $HOME/$ANDROID_DIR  
    build_avatar
    build_lemon
    mv $HOME/$VOWIFI_DIR/$ANDROID_DIR $HOME/
  fi
fi

exit 0

