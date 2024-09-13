#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <unique_string> <username>"
  exit 1
fi

unique_string=$1
username=$2

auth_keys_file="/home/$username/.ssh/authorized_keys"

sed -i "/$unique_string/d" "$auth_keys_file"

echo "Public key containing '$unique_string' removed from $auth_keys_file"
