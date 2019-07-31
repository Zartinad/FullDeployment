# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the installDependancies.sh file, type in you terminal `sh installDependancies.sh

I make references to my react app mk_dashboard which you can check out here: https://github.com/Zartinad/mk_dashboard`
---
---
## 1.Clone the Repository
```
git clone https://github.com/Zartinad/FullDeployment.git
cd FullDeployment
```
---
## 2.Allocate more ram
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
## 3.Install Dependancies
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
## 4.Clone React , Frontend, Backend Files
The following script will clone all the repos and the appropriate (develop) branches neeeded to run the app:
```
sh cloneRepos.sh
```

---
## Setup and deploy React Frontend
Build production build of react project
```
sh dashboardBuild.sh [react-folder]
```
For example with react folder frontend-app: `sh dashboardBuild.sh frontend-app`
It may take awhile to develop the optimized production build, so don't close the terminal.
You should see this on your terminal once it is done
```
The build folder is ready to be deployed.
You may serve it with a static server:

npm install -g serve
serve -s build

Find out more about deployment here:

https://bit.ly/CRA-deploy
```
Configure Nginx
```
sh nginxConfig.sh [react-folder]
```
Your terminal should look like this afterwards:
```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
Dashboard available in 
[ipAddress]/dashboard
```
---
## Deploy MySQL and PhpMyAdmin
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

## Deploy backend and frontend server
Setup servers for frontend and backend
```
sh setupServer [backend folder] [frontend folder]
```
For example `sh setupServer transaction-methods frontend-server`

Enter the information accordingly. Use localhost as your ip address for mysql
```
root@coding-challenge-4:~/FullDeployment# sh setupServer.sh transaction-methods frontend-server
Enter ip address of mysql: 
localhost
Enter user for mysql:
adam
Password for user adam  database access: 
Enter database in mysql (i.e live): 
live
```
Should see all 3 servers live from pm2:
![alt text](https://github.com/Zartinad/FullDeployment/blob/master/Tutorial_Pictures/pm2.png "live database")
When accessing ip-address/frontend and ip-address/backend. You should get back the following message
```
{"msg":"hello! Server is up and running"}
```
