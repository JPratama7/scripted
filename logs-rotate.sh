#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <source_directory> <backup_destination>"
  exit 1
fi

source_dir=$1
backup_dest=$2
date=$(date +%Y%m%d_%H%M%S)
backup_file="backup_$date.tar.gz"

tar -czf "$backup_dest/$backup_file" "$source_dir"

find "$backup_dest" -name "backup_*.tar.gz" -type f -mtime +7 -delete

echo "Backup created: $backup_dest/$backup_file"
echo "Old backups removed"
