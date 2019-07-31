# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the installDependancies.sh file, type in you terminal `sh installDependancies.sh

---
---

## 1.Clone the Repository and setup git configs
```
git clone https://github.com/Zartinad/FullDeployment.git
cd FullDeployment
```
To push changes from the server we need to set the git username and password. Replace [username] or [email] as desired, or leave blank to be filled with server information
```
sh setupGit.sh [username] [email]
```

---
---

## 2. Allocate more ram
We need to allocate more ram to the Ubuntu system for future steps. Run the command in your terminal:
```
sh swapFile.sh
```
Your connection to the ssh terminal should close and your terminal should look like this:
```
root@[ip-address]:~/FullDeployment# sh swapFile.sh 
Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=e38bd4f6-c01c-4ff9-a5bd-d7377a6c8243
root@c[ip-address]:~/FullDeployment# Connection to [ip-address] closed by remote host.
Connection to [ip-address] closed.
```
Make sure to reconnect through ssh and go back to the FullDeployment Folder

```
cd ~/FullDeployment
```

---
---

## 3. Install Dependancies
Install all the dependancies needed to setup the project
```
sh installDependancies.sh
```
Your terminal should look like this at the end:
```
You can now access your default nginx website here
[Your IP Address]
```
If you access the your ip address through a terminal, the default nginx website should appear:

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/installDependanciesNGINX.png "Defualt NGINX PAGE")

---
---

## 4. Clone React , Frontend, Backend Files
The following script will clone all the repos and the appropriate (develop) branches neeeded to run the app:
```
sh cloneRepos.sh
```

---
---

## 5. Setup and deploy React Frontend
Build production build of react project
```
sh dashboardBuild.sh frontend-app
```
It may take awhile to develop the optimized production build, so don't close the terminal.
You should see this on your terminal once it is done:

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/buildComplete.png "Terminal Build")

Configure Nginx to host the frontend production build:
```
sh nginxConfig.sh frontend-app
```
Your terminal should look like this afterwards:
```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
Dashboard available in 
[ipAddress]/dashboard
```

---
---

## 6. Deploy MySQL and PhpMyAdmin
Install MySQL and setup users
```
sh installMySQL.sh
```
It will prompt you to enter a root and and non-root username/password for mysql.
Once you have entered all the information, your terminal should look like this

```
Cleaning Up Database

Setting Up Live Schema

Securing Accounts
Password for root database access: 
Username for database access: adam

Password for user adam database access: 

MYSQL INSTALLED AND SECURED!
```
Install PhpMyAdmin
```
sh installphpMyAdmin.sh
```
When you reach this screen, press TAB and ENTER (we don't want apache or lightppd selected!).

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/phpmyadminskip.png "Skip Apache")
When you reach the screen below, choose yes by clicking ENTER

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/phpmyadminyes.png "YES")
Enter your password for phpmyadmin.

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/phpmyadminpass.png "Password")

Your terminal should have this at the end:
```
phpMyAdmin available at: 138.197.151.255/phpmyadmin
```
When you enter phpmyadmin through your browser, enter the username and password created in the mysql setup

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/phpmyadmin.png "phpmyadmin.png")

When you have successfully logged in, notice that the "live" database has been created for you. You will be using this database for your api calls henceforth

![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/phpmyadminlive.png "live database")

---
---

## 7. Deploy Backend Server
First we need to setup the ecosystem.config. It will prompt you for information to configure the backend ecosystem file.
```
sh setupBackendEcosystem.sh transaction-methods
```
Next, deploy the server by using the following command
```
sh setupBackendServer.sh transaction-methods
```
You should see load_config and server up on pm2 at the end of the terminal screen
![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/backendlive.png "Backend Running")

---
---

## 8. Deploy Frontend Server
Simply run the following command. It will prompt you for mysql credentials
```
 sh setupFrontendServer.sh frontend-server
```
![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/frontendlive.png "Frontend Running")

