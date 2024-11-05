#!/usr/bin/bash

usage() { 
	echo "this script checks the total size of a given dir"
	echo ""
	echo "usage:"
	echo "$0 <pathtodir>"
	echo ""
	echo "please try again!"
}

if [[ "$1" == "-h" || "$#" -eq 0 ]]; then
	usage
	exit 1
fi

dir=$1

# Check if the directory exists
if [[ ! -d "$dir" ]]; then
    echo "Error: Directory '$dir' not found."
    exit 1
fi

size=$(du -sh "$dir" | awk '{print $1}')

echo "Total Size - '$size'"

