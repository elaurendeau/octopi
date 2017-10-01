#!/bin/bash

cd /home/pi
#install vim
sudo apt-get install -y vim
git clone https://github.com/elaurendeau/dotfiles.git
cp /home/pi/dotfiles/_vimrc /home/pi/

#install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/pi/bash_it
/home/pi/bash_it/install.sh

#prepare settings
cd /home/pi/octopi
sudo chmod 777 /home/pi/octopi/haproxy.cfg
sudo chmod 777 /home/pi/octopi/smb.conf
sudo chmod 777 /home/pi/octopi/octopi-network.txt
sudo chmod 777 /home/pi/octopi/wifi_rebooter.sh

# verify if we need to restart the wifi every minute
sudo sh -c "echo '*/5 *   * * *   root     /home/pi/octopi/wifi_rebooter.sh' >> /etc/crontab"

# default wireless config
sudo mv /boot/octopi-network.txt /boot/octopi-network.old
sudo cp /home/pi/octopi/octopi-network.txt /boot/octopi-network.txt
sudo -E vim /boot/octopi-network.txt

# install samba for watched file
sudo mv /etc/samba/smb.conf /etc/samba/smb.old
sudo cp /home/pi/octopi/smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a pi

# configure haproxy
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.old
sudo cp /home/pi/octopi/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo -E vim /etc/haproxy/haproxy.cfg

# reboot to apply changes
sudo reboot now
