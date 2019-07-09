#Everything should happen in the core server 
cd core-server

#Stop Digital Oceans default Apache setup
sudo service apache2 stop

#sudo apt-get update

#Install nginx
#Note: -yes force Ubuntu to install whatever is required by the desired package
sudo apt-get -yes install nginx
