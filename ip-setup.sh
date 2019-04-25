# !/bin/bash

cp -f ./networkfile/interfaces /etc/network/interfaces
service networking restart
echo Done with setting up static ip...
