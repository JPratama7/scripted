#!/bin/bash

log_file="/var/log/cpu_usage.log"
threshold=75

while true; do
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

  if (( $(echo "$cpu_usage > $threshold" | bc -l) )); then
    echo "$(date): High CPU usage - $cpu_usage%" >> "$log_file"
  fi

  sleep 60
done
