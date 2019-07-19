#Install php-fpm, process manager
sudo add-apt-repository -y universe
sudo apt install -y php-fpm php-mysql

#install phpmyadmin
sudo apt install -y phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

#Fix common bug with phpmyadmin
sudo sed -i "s/|\s*\((count(\$analyzed_sql_results\['select_expr'\]\)/| (\1)/g" /usr/share/phpmyadmin/libraries/sql.lib.php


ipAddress=`wget http://ipecho.net/plain -O - -q ; echo`
echo "phpMyAdmin available at: $ipAddress/phpmyadmin"
