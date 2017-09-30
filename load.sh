cd /home/pi
sudo apt-get install -y vim
git clone https://github.com/elaurendeau/dotfiles.git
cp /home/pi/dotfiles/_vimrc /home/pi/
git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/pi/bash_it
/home/pi/bash_it/install.sh
cd /home/pi/octopi
sudo chmod 777 /home/pi/octopi/haproxy.cfg
sudo chmod 777 /home/pi/octopi/smb.conf
sudo mv /etc/samba/smb.conf /etc/samba/smb.old
sudo cp /home/pi/octopi/smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a pi
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.old
sudo cp /home/pi/octopi/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo -E vim /etc/haproxy/haproxy.cfg
sudo reboot now
