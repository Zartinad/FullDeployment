frontend=$1

#Get public ip_address
#ip_address=`wget http://ipecho.net/plain -O - -q ; echo`
#echo $ip_address

touch ./$1/config/component/mysql.js
node inputFrontend.js ./$1/config/component/mysql

echo "" > pm2Delete.txt
pm2 delete "frontend_server"

cd $1
sudo npm install
pm2 start -f frontend_server.js
cd ..

sudo service nginx restart
