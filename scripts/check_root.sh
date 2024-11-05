#!/usr/bin/bash

#echo "run by $(whoami)"

if [[ "$(whoami)" != "root" ]];
then
	echo "you are not root"
else
        echo "you are root"
fi


