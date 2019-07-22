sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
sudo apt-get autoremove -y
sudo apt-get autoclean
rm -rf /etc/mysql
#sudo find / -iname 'mysql*' -exec rm -rf {} \;
sudo apt autoremove mysql-server
