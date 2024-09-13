#!/bin/bash

log_file="/var/log/system_update.log"

echo "System update started at $(date)" >> "$log_file"

if command -v apt-get &> /dev/null; then
  sudo apt-get update >> "$log_file" 2>&1
  sudo apt-get upgrade -y >> "$log_file" 2>&1
elif command -v yum &> /dev/null; then
  sudo yum update -y >> "$log_file" 2>&1
else
  echo "Unsupported package manager" >> "$log_file"
  exit 1
fi

echo "System update completed at $(date)" >> "$log_file"
