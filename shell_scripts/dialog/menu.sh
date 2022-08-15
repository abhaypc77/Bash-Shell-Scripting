#!/bin/sh

show_sys_info()
{
dialog --backtitle "MENU DRIVEN Example" \
       --title "System Info" \
       --msgbox "`uname -a`" 12 40
}


show_uptime()
{
dialog --backtitle "MENU DRIVEN Example" \
       --title "Uptime" \
       --msgbox "`uptime`" 12 40
}


show_disk_info()
{
dialog --backtitle "MENU DRIVEN Example" \
       --title "Uptime" \
       --msgbox "`df -h`" 12 40

}


show_mem_info()
{
dialog --backtitle "MENU DRIVEN Example" \
       --title "Uptime" \
       --msgbox "`free -m`" 12 40

}

#############################################333333

while [ 1 ]
do

  dialog  --title "Main Menu" \
          --backtitle "Menu Driven Example" \
          --menu "Please Select option:" 20 40 6 \
          "1"  "System Info" \
          "2"  "Uptime" \
          "3"  "Disk Info" \
          "4"  "memory Info" \
          "5"  "Exit"  2> temp.$$

  retval=$?

  choice=`cat temp.$$`

  case $retval in
    0)
      case $choice in
        1) show_sys_info
           ;;
        2) show_uptime
           ;;
        3) show_disk_info
           ;;
        4) show_mem_info
           ;;
        5) rm temp.$$
           exit 0
      esac
      ;;
    1)
      echo "Cancel pressed.";;
    255)
      echo "ESC pressed.";;
  esac

  rm temp.$$

done

