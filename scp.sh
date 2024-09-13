#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <source_file> <username> <server_ip>"
  exit 1
fi

source_file=$1
username=$2
server_ip=$3

scp -r "$source_file" "$username@$server_ip:~/"
