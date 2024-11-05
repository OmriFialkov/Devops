#!/usr/bin/bash

while true; do

echo "i will survive"
sleep 6

trap "echo 'I will not die'" SIGINT
 
done
