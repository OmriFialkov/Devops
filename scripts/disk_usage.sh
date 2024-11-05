#!/usr/bin/bash

usage() {
echo "this script checks the current disk usage"
echo "and sends a warning if the usage exceeds a certain threshold."
echo "the certain threshold is decided by you."
echo ""
echo "usage:"
echo "$0 <threshold_as_%>"
echo ""
echo "notice you must be root user to use this script!"
echo "good luck!"
}

if [[ "$1" == "-h" || "$#" -eq 0 ]]; then
	usage
	exit 1
fi

if [[ "$(whoami)" != "root" ]];
then
        echo "you are not the root user, error."
	echo "you must be root to use this script."
	exit 1
fi

#du -sh / 2>/dev/null | awk '{print $1}'

threshold=$1

actual=$(df | grep -w "/" | awk '{print $5}')

percenta=$( echo "$actual" | sed 's/%/ /' )
percentt=$( echo "$1" | sed 's/%/ /' )

if [[ "$percenta" -gt "$percentt" ]]; then
	echo "Warning! - Disk Usage is at $actual, which exceeds the threshold of $threshold."
else
	echo "Disk Usage is at $actual, which does not exceed the threshold of $threshold."
	echo "all good!"
fi
