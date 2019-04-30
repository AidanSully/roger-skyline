# # !/bin/bash
if [[ $(($(date +%s) - $(date +%s -r /var/spool/cron/crontabs/root))) -lt 86400 ]]
then
	echo "Crontab file has been modified" | sudo /usr/sbin/sendmail root
fi
