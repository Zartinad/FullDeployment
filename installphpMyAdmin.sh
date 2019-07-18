#Install php-fpm, process manager
sudo add-apt-repository -y universe
sudo apt install -y php-fpm php-mysql

sudo apt install -y phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

ipAddress=`wget http://ipecho.net/plain -O - -q ; echo`
echo "phpMyAdmin available at: $ipAddress/phpmyadmin"