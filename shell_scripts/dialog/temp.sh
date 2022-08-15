#!/bin/sh
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --clear --title "My  favorite HINDI singer" \
        --menu "Hi, Choose  your favorite HINDI singer:" 20 51 4 \
        "Rafi"  "Mohammed Rafi" \
        "Mukesh" "Mukesh" \
        "Kishore" "Kishore Kumar" \
        "Saigal" "K L Saigal" \
        "Lata"  "Lata Mangeshkar" \
        "Yesudas"  "K J Yesudas" 2> $tempfile

retval=$?

choice=`cat $tempfile`

case $retval in
  0)
    echo "'$choice' is your favorite hindi singer";;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
