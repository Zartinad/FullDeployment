
#Install mysql
sudo apt install -y mysql-server
echo "\n \n Cleaning Up Database"
#Clean the server of default artifacts
mysql < ./databaseScripts/cleanSQL.sql
echo "\n \n Setting Up Live Schema"
#Create the schema meant for live application
mysql < ./databaseScripts/setupSchema.sql
echo "\n \n Securing Accounts"
#Startup script 
mysql < ./databaseScripts/start_script.sql
#Create password for root and user app
sh ./databaseScripts/secureSQL.sh
