#!/bin/bash

# System metrics to check: CPU, Memory, Load, Disk space

# Use functions to collect each metric, with output going to the same file using separate labeling

# Call functions at the end of the script and make then run in a while loop

set -e

METRICS_FILE="metrics.txt"

# Function to write metrics to the file
write_to_metrics(){
    echo "$@" >> "$METRICS_FILE"
}

#function to get cpu metrics
cpu_metrics(){
    top -b -n 1 | grep '%Cpu'
}

#function to get memory metrics
memory_metrics(){
    free -mh
}

#function to get load average
load_average(){
    top -b -n 1 | grep "load average:" | awk '{print $11, $12, $13, $14, $15}'
}

#function to get disk space information
disk_usage(){
    df -h | awk 'NR==1; $NF == "/" {print}'
}

while true; do
    DATE=$(date)
    echo "$DATE: Monitoring script is running. Press CTRL+C to exit"
    write_to_metrics "   Metrics For $DATE   "
    write_to_metrics ""

    write_to_metrics "......Cpu Metrics......."
    write_to_metrics "$(cpu_metrics)"

    write_to_metrics ""
    write_to_metrics ".....Load Average......"
    write_to_metrics "$(load_average)"

    write_to_metrics ""
    write_to_metrics ".....Memory Metrics....."
    write_to_metrics "$(memory_metrics)"

    write_to_metrics ""
    write_to_metrics ".....Disk Usage....."
    write_to_metrics "$(disk_usage)"

    write_to_metrics ""
    sleep 60
done

#set thresholds
#create a single function that does the writing to metrics file
