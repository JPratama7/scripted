#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <public_key_file> <username> <server_ip>"
  exit 1
fi

public_key=$1
username=$2
server_ip=$3

ssh-copy-id -i "$public_key" "$username@$server_ip"
