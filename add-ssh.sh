#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <public_key_file> <username>"
  exit 1
fi

public_key=$1
username=$2

auth_keys_file="/home/$username/.ssh/authorized_keys"
mkdir -p "/home/$username/.ssh"
cat "$public_key" >> "$auth_keys_file"
chmod 600 "$auth_keys_file"
chown "$username:$username" "$auth_keys_file"

echo "Public key added to $auth_keys_file"
