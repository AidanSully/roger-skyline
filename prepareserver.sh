# !/bin/bash

echo installing sudo...
apt-get -y install sudo
echo installing emacs...
apt-get -y install emacs
echo installing fail2ban...
apt-get -y install fail2ban
echo installing ufw...
apt-get -y intall ufw
echo installing apache2...
apt -y install apache2
echo installing open-SSH...
apt -y install openssh-server
echo installing iptables-persistent
apt-get -y install iptables-peristent


read -p "Name of new user:" username
adduser $username

echo Giving $username sudo rights
usermod -aG sudo $username

echo "\n\n"
echo Setting up iptables...
sh ./iptables.sh
echo "\n\n"

echo "\n\n"
echo Setting up SSH...
sh ./ssh-setup.sh
echo "\n\n"

echo "\n\n"
echo Setting up FAIL2BAN...
sh ./fail2ban.sh
echo "\n\n"

echo "\n\n"
echo Setting up scripts...
mv ./scripts/update.sh /etc/cron.d/
mv ./scripts/checkcron.sh /etc/cron.d/
cp iptables.sh /etc/cron.d/
echo "\n\n"

echo "\n\n"
echo Setting up cron...
echo "0 4 * * 0 /bin/sh /etc/cron.d/update.sh
@reboot /bin/sh /etc/cron.d/update.sh
0 0 * * * /bin/sh /etc/cron.d/checkcron.sh
@reboot /bin/sh /etc/cron.d/iptables.sh" >> /var/spool/cron/crontabs/root
echo "\n\n"

echo "setting up apache server\n"
sh ./apache2.sh
reboot
echo "\n\n"