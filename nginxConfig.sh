#!/bin/bash

#Save developer-specific information
ipAddress=$1
dashboardFolder=$2

#Create main configuration file
#Note: We do not touch defualt incase we need it in the future. 
#Note: 'main' is identifier for our configuration file. Could be anything 
configFile="/etc/nginx/sites-available/main"
touch configFile

#Append 
server_code="server {
        listen 80 default_server;
        listen [::]:80 default_server;
        # SSL configuration
        #...
        root /var/www/html;
        index index.php index.html index.htm index.nginx-debian.html;
        server_name $ipAddress;
        location / {
                proxy_pass http://localhost:3000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade \$http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host \$host;
                proxy_cache_bypass \$http_upgrade;
        }
        location /phpmyadmin {
        }
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                root /usr/share/;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }
        location ~ \.(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))$ {
                root /usr/share/phpmyadmin;
        }
        location ~ /\.ht {
                deny all;
        }
        location /dashboard { #When ip_address/dashboard is accessed display the index.html in the react/vue folder
                alias /var/www/$dashboardFolder/build;
                try_files  \$uri \$uri/ /index.html =404;
	}
        location ^~ /static { #Open the css/index files for viewing
                alias /var/www/$dashboardFolder/build/static;
                try_files \$uri =404;
        }
        location ^~ /frontend { #Host frontend on port 3001
                proxy_pass http://localhost:3001;
                proxy_http_version 1.1;
                proxy_set_header Upgrade \$http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host \$host;
                proxy_cache_bypass \$http_upgrade;
        }
}
## To track where nginx is redirecting the path location ##
log_format requests    \" \$request_filename \";
access_log /var/log/nginx/access.log requests;
"

# Replace NGINX config
echo "$server_code" >> configFile

#Create link in site-enabled so it can be accessed and unlink default
sudo ln -s $configFile /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default

#Check if syntax is correct
sudo nginx -t

#Restart NGINX
sudo service nginx restart
sudo systemctl restart nginx
sudo systemctl reload nginx

#Provide link address
LINK="$ip_address/dashboard"

echo "Dashboard available in \n$LINK\n"