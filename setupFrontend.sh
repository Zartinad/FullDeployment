serverfolder=$1

#Get public ip_address
ip_address=`wget http://ipecho.net/plain -O - -q ; echo`
echo $ip_address

#Get password for user app
stty -echo
printf "Password for app databaase access: "
read passwordapp
stty echo
printf "\n"

path=./$serverfolder/mysql.js
cp sample-mysql.js $path

sed -i "/user/c\      user:'app',"  $path
sed -i "/host/c\      host:'$ip_address'," $path
sed -i "/password/c\      password:'$passwordapp'," $path

cd $serverfolder
npm install

pm2 start frontend-server.js
pm2 log frontend-server
