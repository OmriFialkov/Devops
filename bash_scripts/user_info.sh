#!/usr/bin/bash

usage() {
	echo "this script provides information regarding a specific user"
	echo ""
	echo "usage:"
	echo "$0 <username>"
	echo ""
	echo "good luck!"
}

if [[ "$1" == "-h" || "$#" -eq 0 ]]; then
	usage	
	exit 1
fi

username=$1

if ! grep "^$username" /etc/passwd ; then
	echo "user does not exist!"
	exit 1
fi

name=$(echo "$username")
uid=$(grep "^$username" /etc/passwd | awk -F: '{print $3}')
home=$(grep "^$username" /etc/passwd | awk -F: '{print $6}')
shell=$(grep "^$username" /etc/passwd | awk -F: '{print $7}')
group=$(groups "$username" | sed 's/ /,/' | awk -F: '{print $2}')

echo "the information for this user is:"
echo ""

echo "User: $name"
echo "UID: $uid"
echo "Home Directory: $home"
echo "Shell: $shell"
echo "Groups: $group"

echo ""
echo "good luck!"


