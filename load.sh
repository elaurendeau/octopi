cd ~
sudo apt-get install -y vim
git clone https://github.com/elaurendeau/dotfiles.git
cp ~/dotfiles/_vimrc ~
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
bash-it enable plugin git
cd ~/octopi
sudo chmod 777 haproxy.cfg
sudo chmod 777 smb.conf
mv /etc/samba/smb.conf /etc/samba/smb.old
cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a pi
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.old
cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo -E vim /etc/haproxy/haproxy.cfg
sudo reboot now
