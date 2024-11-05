#!/usr/bin/bash

find .  -type f -exec basename {} \;

#find . -type f | awk -F/ '{print $NF}'

#for file in *; do
#     Check if it's a regular file
#    if [[ -f "$file" ]]; then
#        echo "$file"
#    fi
#done
