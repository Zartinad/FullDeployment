sudo apt-get purge phpmyadmin
rm -rf /etc/phpmyadmin
sudo find / -iname 'phpmyadmin*' -exec rm -rf {} \;
sudo apt-get purge php.*

