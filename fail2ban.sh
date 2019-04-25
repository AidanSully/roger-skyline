# !/bin/bash

echo "[sudo] password for thijs:
[DEFAULT]

destmail = root@rs1
sender = root@rs1
mta = sendmail

action = %(action_mwl)s

[sshd]
enabled = true
port = 2222
filter = sshd
bantime = 1m
findtime = 1m
maxretry = 3" >> /etc/fail2ban/jail.local

/etc/init.d/fail2ban restart