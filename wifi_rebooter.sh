#!/bin/bash

#The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
SERVER=8.8.8.8

#Only send two pings, sending output to /dev/null
ping -c2 $SERVER > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
	echo "$(date): No network connection, restarting wlan0" >> /var/log/wifi_restart.log
	# Restart the wireless interface
	sudo /sbin/ifdown --force wlan0
	sleep 5
	sudo /sbin/ifup --force wlan0
fi
