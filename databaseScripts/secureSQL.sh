stty -echo
printf "Password for root database access: "
read passwordroot
printf "\n"

stty echo
printf "Username for database access: "
read username
printf "\n"

stty -echo
printf "Password for user $username database access: "
read passwordapp
printf "\n"
stty echo
printf "\n"

#Create user app with password
mysql -e "CREATE USER '$username'@'%' IDENTIFIED WITH mysql_native_password BY '$passwordapp';"
mysql -e "GRANT ALL PRIVILEGES ON live.* TO '$username'@'%';FLUSH PRIVILEGES;"
#Change root to have password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwordroot'; FLUSH PRIVILEGES;"

#Securely store credentials when wanting to use mysql
#mysql_config_editor set --login-path=root --host=localhost --user=root --password

#mysql_config_editor set --login-path=app --host=localhost --user=app --password
