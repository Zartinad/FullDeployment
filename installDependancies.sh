#Stage updates
sudo apt update

#Install nginx and set up firewall
#Note -y forces yes to any prompts about installations
sudo apt install -y nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw status

#Install MySQL
#sudo apt install mysql-server
#sudo mysql_secure_installation

#Install php-fpm, process manager
sudo add-apt-repository -y universe
sudo apt install -y php-fpm php-mysql


#Update Ubuntu to download new versions of node properly.
#This was due to a problem where ubuntu would download an 
#outdated version of node that would not compile react properly
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

#Install node, npm, git
#Note: nodejs includes npm and node already
sudo apt-get -y install nodejs git

#Install pm2, a process management tool for node
npm install -y pm2@latest -g

echo  "\n ======PACKAGE VERSIONS====== \n"

#Check all the versions
echo "Node Version:"
node -v
echo "NPM Version:"
npm -v
echo "Git Version:"
git --version
echo "PM2 Version:"
pm2 --version

echo "\n \n"
echo "You can now access your default nginx website here"
curl -4 icanhazip.com