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

cp sample-ecosystem.config.js ./$serverfolder/ecosystem.config.js

sed -i "/DB_USER/c\      DB_USER:'app',"  ./ecosystem.config.js
sed -i "/DB_HOST/c\      DB_HOST:'$ip_address'," ./ecosystem.config.js
sed -i "/DB_PASS/c\      DB_PASS:'$passwordapp'," ./ecosystem.config.js
sed -i "/DB_DATABASE/c\      DB_DATABASE:'live'," ./ecosystem.config.js
sed -i "/INVESTMENT_ACNT/c\      INVESTMENT_ACNT:'investment_user'," ./ecosystem.config.js
sed -i "/RAKE_ACNT/c\      RAKE_ACNT:'rake_user'" ./ecosystem.config.js

cd $serverfolder
npm install

pm2 start ecosystem.config.js
pm2 log server