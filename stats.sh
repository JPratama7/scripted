#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory=$1

printf "%-30s %-10s %-10s %-10s\n" "Filename" "Lines" "Words" "Characters"
echo "--------------------------------------------------------------"

for file in "$directory"/*.txt; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    stats=$(wc -lwm "$file")
    printf "%-30s %-10s %-10s %-10s\n" "$filename" $stats
  fi
done
