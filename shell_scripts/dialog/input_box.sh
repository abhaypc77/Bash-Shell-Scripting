#!/bin/bash

dialog --title "Inputbox" \
       --backtitle "Dialog Box Example" \
       --inputbox "Enter your name please" 7 40 2>input.$$

ret=$?
name=`cat input.$$`

case $ret in
  0) echo "Hello $name"
     ;;
  1) echo "Cancel is Pressed"
     ;;
  255) echo "ESC pressed"
     ;;
esac

rm -f input.$$
