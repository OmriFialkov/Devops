#!/usr/bin/bash

valid=true
count=1
while [ $valid ]
do
	echo $count
	if [[ $count == 5 ]];
	then
	 break 
	fi
	((count++))
done
