
sudo apt install -y phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

ipAddress=`wget http://ipecho.net/plain -O - -q ; echo`
echo "phpMyAdmin available at: $ipAddress/phpmyadmin"