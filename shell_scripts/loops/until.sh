#!/bin/bash

option=1

until [ $option -eq 5 ]; do
    echo ""
    echo "MAIN-MENU"
    echo "*********"
    echo "1 - System Info"
    echo "2 - Uptime"
    echo "3 - Disk Info"
    echo "4 - Memory Info"
    echo "5 - Exit"
    echo ""
    echo -n "Enter option: "
    read option
    echo ""
    case $option in
        1 ) echo "System Info :"
            uname -a
            ;;
        2 ) echo "Uptime :"
            uptime
            ;;
        3 ) echo "Disk Info :"
            df -h
            ;;
        4 ) echo "Memory Info :"
            free
            ;;
        5 ) exit
            ;;
        * ) echo "Please Enter 1-5"
    esac
done
       
