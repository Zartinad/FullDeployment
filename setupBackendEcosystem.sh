backend=$1

#Get public ip_address
#ip_address=`wget http://ipecho.net/plain -O - -q ; echo`
#echo $ip_address

echo "Enter ip address of mysql or leave empty to use local public ip: "
read ipAddressPre
ipAddress=`sh ipInput.sh $ipAddressPre`
echo $ipAddress
echo "Enter user for mysql:"
read user

#Get password for user app
stty -echo
printf "Password for user $user  database access: "
read passwordapp
stty echo
printf "\n"

echo "Enter database in mysql (i.e live): "
read dbname

##Main Accounts Input
echo "Enter investment account"
read investAct

echo "Enter rake account:"
read rakeAct

echo "Enter FX account:"
read fxAct

echo "Enter Withdrawl Fees account:"
read wthdrawFeeAct

##BTC Input
echo "Enter BTC Pay Host:"
read btcPayHost

echo "Enter BTC Pay Port:"
read btcPayPort

echo "Enter BTC Pay User:"
read btcPayRPCUser

echo "Enter BTC Pay Pass:"
read btcPayRPCPass

##Clam Input
echo "Enter Clam Pay Host:"
read clamPayHost

echo "Enter Clam Pay Port:"
read clamPayPort

echo "Enter Clam Pay User:"
read clamPayRPCUser

echo "Enter Clam Pay Pass:"
read clamPayRPCPass

#Configure Backend server
cp -f sampleConfigs/sample-ecosystem.config.js ecosystem.config.js

sed -i "/DB_USER/c\      DB_USER:'$user',"  ecosystem.config.js
sed -i "/DB_HOST/c\      DB_HOST:'$ipAddress'," ecosystem.config.js
sed -i "/DB_PASS/c\      DB_PASS:'$passwordapp'," ecosystem.config.js
sed -i "/DB_DATABASE/c\      DB_DATABASE:'$dbname'," ecosystem.config.js

sed -i "/INVESTMENT_ACNT/c\      INVESTMENT_ACNT:'$investAct'," ecosystem.config.js
sed -i "/RAKE_ACNT/c\      RAKE_ACNT:'$rakeAct'," ecosystem.config.js
sed -i "/FX_ACNT/c\      FX_ACNT:'$fxAct'," ecosystem.config.js

sed -i "/WITHDRAWAL_FEES_ACNT/c\      WITHDRAWAL_FEES_ACNT:'$wthdrawFeeAct'," ecosystem.config.js

sed -i "/BTC_PAY_HOST/c\      BTC_PAY_HOST:'$btcPayHost'," ecosystem.config.js
sed -i "/BTC_PAY_PORT/c\      BTC_PAY_PORT:'$btcPayPort'," ecosystem.config.js
sed -i "/BTC_PAY_RPC_USER/c\      BTC_PAY_RPC_USER:'$btcPayRPCUser'," ecosystem.config.js
sed -i "/BTC_PAY_RPC_PASS/c\      BTC_PAY_RPC_PASS:'$btcPayRPCPass'," ecosystem.config.js

sed -i "/CLAM_PAY_HOST/c\      CLAM_PAY_HOST:'$clamPayHost'," ecosystem.config.js
sed -i "/CLAM_PAY_PORT/c\      CLAM_PAY_PORT:'$clamPayPort'," ecosystem.config.js
sed -i "/CLAM_PAY_RPC_USER/c\      CLAM_PAY_RPC_USER:'$clamPayRPCUser'," ecosystem.config.js
sed -i "/CLAM_PAY_RPC_PASS/c\      CLAM_PAY_RPC_PASS:'$clamPayRPCPass'," ecosystem.config.js


cp -f "ecosystem.config.js" ./$backend/ecosystem.config.js
