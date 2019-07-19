backend=$1
frontend=$2

#Get public ip_address
#ip_address=`wget http://ipecho.net/plain -O - -q ; echo`
#echo $ip_address

echo "Enter ip address of mysql: "
read ipAddress

echo "Enter user for mysql:"
read user

#Get password for user app
stty -echo
printf "Password for app database access: "
read passwordapp
stty echo
printf "\n"

cp ./sampleConfigs/sample-mysql.js mysql.js

sed -i "/user/c\      user:'$user',"  mysql.js
sed -i "/host/c\      host:'$ipAddress'," mysql.js
sed -i "/password/c\      password:'$passwordapp'," mysql.js
sed -i "/database/c\      database:'live'," mysql.js


cp -f "mysql.js" ./$1/config/components/
cp -f "mysql.js" ./$2/config/components/

pm2 delete 0
pm2 delete 1

cd $1
npm install
pm2 start -f server.js

cd ..

cd $2
npm install
pm2 start -f frontend_server.js

sudo service nginx restart
