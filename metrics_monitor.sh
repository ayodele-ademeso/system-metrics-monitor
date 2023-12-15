#!/bin/bash
# Bash Script Homework
# Create monitoring script that checks various system metrics, services, and log. 
# Look into essential metrics and set the thresholds. How do I set thresholds?
# Make sure to implement error handling and extract the outputs of the information into metrics.txt file 

#### Approach ####
# System metrics to check
# CPU, Memory, Load, Disk space

# Use functions to collect each metric, with output going to the same file using separate labeling

# Call functions at the end of the script and make then run in a while loop

set -e

METRICS_FILE="metrics.txt"

#function to get cpu metrics
cpu_metrics(){
    DATE=$(date)
    echo "Metrics for $DATE" >> $METRICS_FILE
    top -b -n 1 | grep '%Cpu' >> $METRICS_FILE
}

#function to get memory metrics
memory_metrics(){
    DATE=$(date)
    echo "Metrics for $DATE" >> $METRICS_FILE
    free -mh >> $METRICS_FILE
}

#function to get load average
load_average(){
    DATE=$(date)
    echo "Metrics for $DATE" >> $METRICS_FILE
    top -b -n 1 | grep "load average:" >> $METRICS_FILE
}

#function to get disk space information
disk_usage(){
    DATE=$(date)
    echo "Metrics for $DATE" >> $METRICS_FILE
    df -h >> $METRICS_FILE
}

# print date in the beginning of metrics file
# echo "Metrics for $DATE" >> $METRICS_FILE
# cpu_metrics

while true; do
    echo "" >> $METRICS_FILE
    echo "......CPU METRICS......." >> $METRICS_FILE
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
