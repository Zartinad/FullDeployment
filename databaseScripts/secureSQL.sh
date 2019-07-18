echo "Enter password for app user. This will be used for backend and frontened database credentials"
read passwordapp
echo "Enter password for root database access"
read passwordroot

#Create user app with password
mysql -e "CREATE USER app IDENTIFIED BY '$passwordApp';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';"
#Change root to have password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwordroot'; FLUSH PRIVILEGES;"

#Securely store credentials when wanting to use mysql
mysql_config_editor set --login-path=root --host=localhost --user=root --password=$passwordroot
mysql_config_editor set --login-path=app --host=localhost --user=app --password=$passwordapp