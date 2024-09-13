#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <key_directory>"
  exit 1
fi

key_dir=$1

if [ ! -d "$key_dir" ]; then
  mkdir -p "$key_dir"
fi

ssh-keygen -t rsa -b 4096 -f "$key_dir/id_rsa" -N ""

echo "SSH key pair generated and saved in $key_dir"
