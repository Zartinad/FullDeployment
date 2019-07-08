#!/bin/bash
#
#

# Delete default server code
sed -i  '21, $d'  /etc/nginx/sites-available/default

#Append 
server_code='server {
        listen 80 default_server;
        listen [::]:80 default_server;
        # SSL configuration
        #...
        root /var/www/html;
        index index.php index.html index.htm index.nginx-debian.html;
        server_name;
        location / {
                proxy_pass http://localhost:3000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
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
                alias /var/www/mk_dashboard/build;
                try_files  $uri $uri/ /index.html =404;
	}
        location ^~ /static { #Open the css/index files for viewing
                alias /var/www/mk_dashboard/build/static;
                try_files $uri =404;
        }
        location ^~ /frontend { #Host frontend on port 3001
                proxy_pass http://localhost:3001;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }
}
## To track where nginx is redirecting the path location ##
log_format requests    " $request_filename ";
access_log /var/log/nginx/access.log requests;
'

# Append server code
echo "$server_code" >> /etc/nginx/sites-available/default

# Change ip address
echo -n "Enter ip address: "
read ip_address
sed -i "/server_name/c\        server_name $ip_address;" /etc/nginx/sites-available/default