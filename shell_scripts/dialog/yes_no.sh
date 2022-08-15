#!/bin/bash

dialog --title "Delete file" \
       --backtitle "Yes No Example" \
       --yesno "Are you sure you want to permanently delete \"backup.txt\"?" 7 60

response=$?
case $response in
   0) echo "File deleted."
      ;;
   1) echo "File not deleted."
      ;;
   255) echo "ESC key pressed."
      ;;
esac
