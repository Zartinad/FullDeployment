stty -echo
printf "Password for root database access: "
read passwordroot
printf "\n"
printf "Password for app databaase access: "
read passwordapp
stty echo
printf "\n"

#Create user app with password
mysql -e "CREATE USER app IDENTIFIED BY '$passwordapp';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY '$passwordroot';"
#Change root to have password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwordroot'; FLUSH PRIVILEGES;"

#Securely store credentials when wanting to use mysql
#mysql_config_editor set --login-path=root --host=localhost --user=root --password

#mysql_config_editor set --login-path=app --host=localhost --user=app --password
