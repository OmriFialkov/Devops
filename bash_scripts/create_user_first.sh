#!/usr/bin/bash

echo "run by $(whoami)"

if 	[[  "$(whoami)" != "root" ]]; then
	echo "you must be root!"
	exit 1
fi

for num in $(seq 10 15)
do	echo "adding user user${num}"

if 	grep -wq "user${num}" /etc/passwd;

then 
	echo "user user${num} already exists"
else
	echo useradd -m -s /bin/bash "user${num}"
	echo "user user$num was added successfully"
fi
done
