backend=$1
frontend=$2

#Get public ip_address
ip_address=`wget http://ipecho.net/plain -O - -q ; echo`
echo $ip_address

#Get password for user app
stty -echo
printf "Password for app database access: "
read passwordapp
stty echo
printf "\n"


cp ./sampleConfigs/sample-mysql.js mysql.js

sed -i "/user/c\      user:'app',"  mysql.js
sed -i "/host/c\      host:'$ip_address'," mysql.js
sed -i "/password/c\      password:'$passwordapp'," mysql.js

mv -f mysql.js ./$1/config/components/
mv -f mysql.js ./$2/config/components/

cd $1
npm install
pm2 start server.js

cd ..

cd $2
npm install
pm2 start frontend_server.js

