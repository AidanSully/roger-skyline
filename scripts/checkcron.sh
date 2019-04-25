# !/bin/bash

[ -z `find /var/spool/cron/crontabs/root -mmin -1440` ]
if [ $? -eq 0 ]
then
#    Updated: 2019/04/23 19:37:02 by tmeulenb      ########   odam.nl          #
else
    echo "cron has not been updated" | sendmail root
fi