
#Install mysql
sudo apt install -y mysql-server
echo "\nCleaning Up Database"
#Clean the server of default artifacts
mysql < ./databaseScripts/cleanSQL.sql
echo "\nSetting Up Live Schema"
#Create the schema meant for live application
mysql < ./databaseScripts/setupSchema.sql
echo "\nSecuring Accounts"
#Startup script 
mysql live < ./transaction-methods/target,sql
#Create password for root and user app
sh ./databaseScripts/secureSQL.sh
echo "MYSQL INSTALLED AND SECURED!"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart
