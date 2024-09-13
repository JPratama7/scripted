#!/bin/bash

hostname=$(hostname)
current_time=$(date)
logged_users=$(who | wc -l)

echo "Hostname: $hostname"
echo "Current Time: $current_time"
echo "Logged in Users: $logged_users"
