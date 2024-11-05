#!/usr/bin/bash

if [[ -z "$1" ]]; then
    echo "Error: You must provide a filename."
    exit 1
fi

echo "Searching for: '$1'"

result=$(find . -type f -name "$1" -print )

#status=$?
#echo "Find command output: '$result'"
#echo "Find command exit status: $status"

if [[ -n "$result" ]]; then
    echo "File exists"
else
    echo "File does not exist"
fi

