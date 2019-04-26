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
mv ./scripts/update.sh /root/
mv ./scripts/checkcron.sh /root/
echo "\n\n"

echo "\n\n"
echo Setting up cron...
echo "0 4 * * 0 sh /root/update.sh

@reboot sh /root/update.sh

0 0 * * * sh /root/checkcron.sh" >> crontab -e
echo "\n\n"

echo "setting up apache server\n"
sh ./apache2.sh
echo "\n\n"