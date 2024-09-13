#!/bin/bash

threshold=80
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage is at ${disk_usage}%"

if [ "$disk_usage" -gt "$threshold" ]; then
  echo "Disk usage is at ${disk_usage}%, which is above the ${threshold}% threshold."
fi
