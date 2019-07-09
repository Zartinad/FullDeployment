#Stage updates
apt-get update

#Update Ubuntu to download new versions of node properly.
#This was due to a problem where ubuntu would download an 
#outdated version of node that would not compile react properly
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

#Install node, npm, git
#Note: nodejs includes npm and node already
sudo apt-get install nodejs git

#Install pm2, a process management tool for node
npm install pm2@latest -g

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
