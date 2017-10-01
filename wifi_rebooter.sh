#!/bin/bash

#The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
SERVER=192.168.0.1

#Only send two pings, sending output to /dev/null
ping -c2 $SERVER > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
	echo "$(date): No network connection, restarting wlan0" >> /var/log/wifi_restart.log
	# Restart the wireless interface
	ifdown --force wlan0
	sleep 5
	ifup wlan0
fi
