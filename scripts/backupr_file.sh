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

# Use find to search for the file and store the full path in a variable
file_found=$(find . -type f -name "$1" -print -quit)

if [[ -n "$file_found" ]]; then
    # Use the full path for cp command
    cp "$file_found" "$file_found.bak"
    echo "Backup of file: '$file_found' created as '$file_found.bak' in $(pwd)"
else
    echo "file '$1' not found, please check the filename and try again."
    exit 1
fi
