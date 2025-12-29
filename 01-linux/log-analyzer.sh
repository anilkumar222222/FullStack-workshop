#!/bin/bash

Log_file=${1:-"C:\Users\Anil\Downloads\sample-log.txt"}

if [ ! -f "$Log_file" ]; then
    echo "Error: Log file not found: $LOG_FILE"
    exit 1
fi

total_lines=$(wc -l < "$Log_file")

ip_address=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$Log_file" | sort | uniq)

echo "=== Log Analysis Report ==="
echo "File: $Log_file"
echo "TOTAL LINES: $total_lines"
echo "----------------------------"
echo "INFO: $(grep -c -i 'info' "$Log_file")"
echo "Error: $(grep -c -i 'error' "$Log_file")"
echo "Warning: $(grep -c -i 'warning' "$Log_file")"
echo "----------------------------"

echo "Unique IP Address Found:"

if [ -n "$ip_address" ]; then
    for ip in $ip_address; do
        echo " - $ip"
    done
else
    echo " No IP addresses found"
fi

echo "============================"
