#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <python_script_path> <service name>"
  exit 1
fi

python_script=$1
service_name=$(basename "$python_script" .py)

cat << EOF > "/etc/systemd/system/$service_name.service"
[Unit]
Description=Python script service
After=network.target

[Service]
ExecStart=/usr/bin/python3 $python_script
Restart=always
User=nobody

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now "$service_name.service"

echo "Service created and started: $service_name"
