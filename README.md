# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the install_dependancies.sh file, type `sh install_dependancies.sh`

**MOVE YOUR REACT/VUE FOLDER IN THIS FOLDER**
Refer to mk_dashboard for reference of a react project.

## Order of scripts
1. install_dependancies.sh - This will install nodejs, npm, pm2, etc needed to compile and host the app
2. dashboardBuild.sh - This will create the production build of your app. Pass your foldername as an argument.
3. nginx_setup.sh - This will install nginx and set the system configs to proxy properly
4. nginx_dashboard.sh - This will configure nginx to host your project in the /dashboard directory of your site
