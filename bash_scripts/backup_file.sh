#!/usr/bin/bash

usage() {
echo "this script accepts a file as an argument and creates a copy of it"
echo ""
echo "usage:"
echo "$0 <filename>"
echo ""
echo "<filename> - the file to backup"
echo ""
echo "please run the script from where the file is located"
echo "type it accurately"
exit 1
}

if [[ "$1" == "-h" || "$#" == 0 ]]; then
usage
fi

#if [[ ! -f "$1" ]]; then - better -f is for files that exist. working! but not recursively.
#if ! find . -type f -name "$1" -quit &>/dev/null ;  - not working "find"
if ! find . -type f -name "$1" -print -quit | grep -q .; #working - non recursive!
then 
	echo "file '$1' not found, please check the filename and try again."
	echo "it could be the file does not exist at all."
	exit 1
else 
	#echo cp "$1" "$1.bak"
	cp "$1" "$1.bak"
	echo "Backup of file: '$1' created as '$1.bak' in $(pwd)"
fi
