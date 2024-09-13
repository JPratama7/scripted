#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <action> <service_name>"
  echo "Actions: start, stop, status"
  exit 1
fi

action=$1
service=$2

case $action in
  start)
    sudo systemctl start $service
    ;;
  stop)
    sudo systemctl stop $service
    ;;
  status)
    sudo systemctl status $service
    ;;
  *)
    echo "Invalid action. Use start, stop, or status."
    exit 1
    ;;
esac
