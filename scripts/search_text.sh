#!/usr/bin/bash

usage() {
echo "this script searches a specific test in all files in the current dir"
echo "where it is running from and its subdirs."
echo ""
echo "usage:"
echo "$0 <stringtosearchfor>"
echo ""
echo "now go!"
}

if [[ "$1" == "-h" || "$#" -eq 0 ]]; then
	usage
	exit 1
fi

string=$1

found=$(find . -type f -exec grep -il "$string" {} \;)

if [[ -z "$found" ]]; then
    echo "No files found containing '$string'."
    exit 0
fi

#creates a for loop that writes found in for every file - with no "" in the $found!#
for i in $found ; do 
echo "found in '$i'"
done

#echo "found in:" 
#echo "$found"
