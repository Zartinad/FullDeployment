backend=$1

echo "" > pm2Delete.txt
pm2 delete load_config
pm2 delete server

cd $backend
sudo npm install
sudo npm rebuild
pm2 start -f ecosystem.config.js
cd ..

sudo service nginx restart
