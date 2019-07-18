
#Install mysql
sudo apt install -y mysql-server

#Clean the server of default artifacts
mysql < ./databaseScripts/cleanSQL.sql

#Create the schema meant for live application
mysql < ./databaseScripts/schema.sql

#Create password for root and user app
sh ./databaseScripts/secureSQL.sh