apt install mailutils
apt install postfix

sed -i 's/inet_interfaces = all/inet_interfaces = loopback-only/g' /etc/postfix/main.cf
sed -i 's/mydestination = $myhostname, aidan.com, debian, localhost.localdomain, localhost/mydestination = $myhostname, localhost.$aidan.com, $aidan.com/g' /etc/postfix/main.cf
sudo systemctl restart postfix
