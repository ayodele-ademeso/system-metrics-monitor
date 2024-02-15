# System Metrics Monitor

## Description

This is a script designed to collect various system metrics and save the output to a text file. This script can be useful for monitoring system performance over time.

## How to Run the Script

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/ayodele-ademeso/system-metrics-monitor.git
   cd system-metrics-monitor

2. **Make the script executable (if not already)**
    ```bash
    chmod +x ./metrics_monitor.sh

3. **Run the script**
    ```bash
    ./metrics_monitor.sh

4. **Open the text file to view the metrics collected**
    ```bash
    cat ./metrics.txt

## Adding the script to system $PATH

To make it easier to run the script from any directory, you can add the script to a directory that is included in your $PATH.

1. **Move the script to /usr/local/bin**
   ```bash
   mv ./metrics_monitor.sh /usr/local/bin/

2. **Run the script from anywhere in your terminal**
   ```bash
   metrics_monitor.sh