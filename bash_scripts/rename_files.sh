#!/usr/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <prefix>"
    echo "This script renames all files in the current directory by adding the given prefix."
}

# Check if an argument is provided
if [[ $# -ne 1 ]]; then
    usage
    exit 1
fi

prefix=$1

# Loop through all files in the current directory
for file in *; do
    # Check if it is a file
    if [[ -f "$file" ]]; then
        # Create the new filename
        new_name="${prefix}${file}"
        # Rename the file
        mv "$file" "$new_name"
        echo "Renamed $file to $new_name"
    fi
done
