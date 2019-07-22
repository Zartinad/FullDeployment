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

#Path to ecosystem config file
path=./$serverfolder/ecosystem.config.js
cp sampleConfigs/sample-ecosystem.config.js $path

sed -i "/DB_USER/c\      DB_USER:'app',"  $path
sed -i "/DB_HOST/c\      DB_HOST:'$ip_address'," $path
sed -i "/DB_PASS/c\      DB_PASS:'$password'," $path
sed -i "/DB_DATABASE/c\      DB_DATABASE:'live'," $path
sed -i "/INVESTMENT_ACNT/c\      INVESTMENT_ACNT:'investment_user'," $path
sed -i "/RAKE_ACNT/c\      RAKE_ACNT:'rake_user'" $path
cd $serverfolder
npm install

pm2 delete ser
pm2 start ecosystem.config.js
pm2 log server
