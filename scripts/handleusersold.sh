#!/usr/bin/bash

# Usage function to display help
usage() {
    echo "Usage: $0 [-h] username"
    echo "-h            Show this help message"
    echo "username      Specify the username to create"
}

# Check if the -h option is provided
if [[ "$1" == "-h" ]]; then
    usage
    exit 0
fi

# Check if a username is provided
if [ -z "$1" ]; then
    echo "Error: No username provided."
    usage
    exit 1
fi

USERNAME=$1

# Create the user, create home directory, and set default shell to /usr/bin/bash
sudo useradd -m -s /usr/bin/bash "$USERNAME"

# Check if the user creation was successful
if [ $? -eq 0 ]; then
    echo "User '$USERNAME' has been created successfully with /usr/bin/bash as the default shell."
else
    echo "Error: Failed to create user '$USERNAME'."
    exit 1
fi
