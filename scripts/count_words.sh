#!/usr/bin/bash

usage() {
	echo "this script is counting words in a specific file"
	echo ""
	echo "usage:"
	echo "$0 <filenametocheckwordscount>"
	echo ""
	echo "good luck!"
}

if [[ "$1" == "-h" || "$#" -eq 0 ]]; then
	usage	
	exit 1
fi

filename=$1

if [[ ! -f "$filename" ]]; then
	echo "file does not exist!"
	exit 1
fi

count=$(wc -w "$filename" | awk '{print $1}')

echo "The file $filename contains $count words."

