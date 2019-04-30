# !/bin/bash

echo "[DEFAULT]

destmail = root@debian
sender = root@debian
mta = sendmail

action = %(action_mwl)s

[sshd]
enabled = true
port = 420
filter = sshd
bantime = 1m
findtime = 1m
maxretry = 3" >> /etc/fail2ban/jail.local

/etc/init.d/fail2ban restart