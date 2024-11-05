#!/usr/bin/bash

# Usage function
usage() {
    echo "Usage: $0 [options] <username>"
    echo ""
    echo "Options:"
    echo "  -h    Show this help message"
    echo ""
    echo "<username>:"
    echo "specify the username's name to create"
    echo ""
    echo "Example:"
    echo "$0 newuser"
    exit 1
}

# Check if no arguments or -h is provided
if [[ "$#" -eq 0 || "$1" == "-h" ]]; then
    usage
fi

# Get the username from the command line argument
USERNAME=$1

# Check if the user already exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
    exit 1
fi

# prompt for password
echo "enter password for the new user:"
read -s PASSWORD

# Create the user with home directory and bash shell
sudo useradd -m -s /bin/bash "$USERNAME"

# set the user's password
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Check if the user was created successfully
if [ $? -eq 0 ]; then
    echo "User '$USERNAME' has been created with /bin/bash shell and home directory."
else
    echo "Failed to create user '$USERNAME'."
    exit 1
fi
