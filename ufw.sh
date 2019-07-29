sudo ufw allow 'Nginx HTTP'
#ssh
sudo ufw limit 22
#https
sudo ufw allow 443
#http
sudo ufw allow 80
#mysql
sudo ufw allow 3306

sudo ufw status
sudo ufw --force enable