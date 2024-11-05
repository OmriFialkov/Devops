#!/usr/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <interval_in_seconds> <number_of_checks>"
    echo "This script monitors CPU and memory usage at regular intervals."
}

# Check if the correct number of arguments is provided
if [[ $# -lt 1 || $# -gt 2 ]]; then
    usage
    exit 1
fi

interval=$1
count=${2:-0}  # Default to 0 if no second argument is provided

# Check if the interval is a positive integer
if ! [[ "$interval" =~ ^[0-9]+$ ]]; then
    echo "Error: Interval must be a positive integer."
    exit 1
fi

# Monitor CPU and memory usage
check_count=1

if [[ $count -eq 0 ]]; then
    while true; do
        used_cpu=$(echo "100 - $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')" | bc)
        used_memory=$(free -m | awk '/Mem:/ {print $3 "MB"}')

        echo "Check $check_count: CPU: $used_cpu%, Memory: $used_memory"
        check_count=$((check_count + 1))

        sleep "$interval"
    done
else
    for (( i=1; i<=$count; i++ )); do
        used_cpu=$(echo "100 - $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')" | bc)
        used_memory=$(free -m | awk '/Mem:/ {print $3 "MB"}')

        echo "Check $i: CPU: $used_cpu%, Memory: $used_memory"

        sleep "$interval"
    done
fi

