#!/usr/bin/bash

usage() {
echo "usage for $0:"
echo "choose a number and type it"
echo "the script will count down from this number to zero"
echo "for example: $0 <number>"
echo "start again!"
exit 1
}

if [[ "$#" -eq 0 || "$1" == "-h" ]]; then
    usage
fi

#if ! [[ ]] ; then
#echo "you have to choose a number only!"
#echo ""
#usage
#exit 1
#fi

num=$1

#while [[ "$num" -ge 0 ]]; do
#    echo "$num"
#    num=$((num - 1))  # Decrement in a more readable way
#done

seq "$num" -1 0

echo ""
echo "done!"
