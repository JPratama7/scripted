#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <username> <server_ip>"
  exit 1
fi

username=$1
server_ip=$2

ssh -q "$username@$server_ip" exit

if [ $? -eq 0 ]; then
  echo "SSH connection successful"
else
  echo "SSH connection failed"
fi
