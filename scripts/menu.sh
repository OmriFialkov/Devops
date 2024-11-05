#!/usr/bin/bash

echo ""
echo "this script will do whatever you want from the following options,"
echo "you just select the wanted option's number and type it down."
echo ""
echo "here are the options:"
echo ""

echo "1) Display date and time."
echo "2) list files in current directory."
echo "3) show disk usage of current directory."
echo "4) Exit"

echo ""
echo "enter your choice:"

read choice
 
echo ""

case "$choice" in
	1)
	echo "Date and Time: $(date +"%Y-%m-%d %H:%M:%S")"
	;;	
	2)
	ls -ltr
	;;
	3) 
	disk=$(du -sh | awk '{print $1}')
	echo "the disk usage of $(pwd) is $disk."
	;;
	4)
	echo "exiting.."
	exit 0
	;;
	*)
	echo "Invalid Choice, please enter a number from 1 to 4 accordingly."
	;;
esac


