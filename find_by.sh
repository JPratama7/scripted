#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <directory> <file_extension>"
  exit 1
fi

directory=$1
extension=$2

find "$directory" -type f -name "*.$extension"
