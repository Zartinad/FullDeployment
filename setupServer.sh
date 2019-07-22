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

echo "Enter database in mysql (i.e live): "
read dbname

#Configure Backend server
cp -f sampleConfigs/sample-ecosystem.config.js ecosystem.config.js

sed -i "/DB_USER/c\      DB_USER:'$user',"  ecosystem.config.js
sed -i "/DB_HOST/c\      DB_HOST:'$ipAddress'," ecosystem.config.js
sed -i "/DB_PASS/c\      DB_PASS:'$passwordapp'," ecosystem.config.js
sed -i "/DB_DATABASE/c\      DB_DATABASE:'$dbname'," ecosystem.config.js
sed -i "/INVESTMENT_ACNT/c\      INVESTMENT_ACNT:'investment_user'," ecosystem.config.js
sed -i "/RAKE_ACNT/c\      RAKE_ACNT:'rake_user'" ecosystem.config.js

cp -f "ecosystem.config.js" ./$1/ecosystem.config.js

#Configure Frontend server
cp ./sampleConfigs/sample-mysql.js mysql.js

sed -i "/user/c\      user:'$user',"  mysql.js
sed -i "/host/c\      host:'$ipAddress'," mysql.js
sed -i "/password/c\      password:'$passwordapp'," mysql.js
sed -i "/database/c\      database:'live'," mysql.js

cp -f "mysql.js" ./$2/config/components/

echo "" > pm2Delete.txt
pm2 delete 0 >> pm2Delete.txt
pm2 delete 1 >> pm2Delete.txt
pm2 delete /*/

cd $1
npm install
pm2 start -f ecosystem.config.js
cd ..

cd $2
npm install
pm2 start -f frontend_server.js

sudo service nginx restart
