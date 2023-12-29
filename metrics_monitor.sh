#!/bin/bash

# System metrics to check: CPU, Memory, Load, Disk space

# Use functions to collect each metric, with output going to the same file using separate labeling

# Call functions at the end of the script and make then run in a while loop

set -e

METRICS_FILE="metrics.txt"

#function to get cpu metrics
cpu_metrics(){
    top -b -n 1 | grep '%Cpu' >> $METRICS_FILE
}

#function to get memory metrics
memory_metrics(){
    free -mh >> $METRICS_FILE
}

#function to get load average
load_average(){
    top -b -n 1 | grep "load average:" | awk '{print $11, $12, $13, $14, $15}' >> $METRICS_FILE
}

#function to get disk space information
disk_usage(){
    df -h | awk 'NR==1; $NF == "/" {print}' >> $METRICS_FILE
}

while true; do
    DATE=$(date)
    echo "   Metrics For $DATE   " >> $METRICS_FILE
    echo "" >> $METRICS_FILE
    echo "......Cpu Metrics......." >> $METRICS_FILE
    cpu_metrics
    echo "" >> $METRICS_FILE
    echo ".....Load Average......" >> $METRICS_FILE
    load_average
    echo "" >> $METRICS_FILE
    echo ".....Memory Metrics....." >> $METRICS_FILE
    memory_metrics
    echo "" >> $METRICS_FILE
    echo ".....Disk Usage....." >> $METRICS_FILE
    disk_usage
    echo "" >> $METRICS_FILE
    sleep 60
done

#set thresholds
# create a single function that does the writing to metrics file
