# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the installDependancies.sh file, type in you terminal `sh installDependancies.sh`

**MOVE YOUR REACT/VUE FOLDER IN THIS FOLDER**
Refer to mk_dashboard for reference of a react project.

## Order of scripts
1. installDependancies.sh - This will install and configure all the relevant dependancies like NGINX, pm2, node, git needed to deploy your project.
`sh installDependancies.sh`
![Alt text](Tutorial_Pictures/installDependancies.png?raw=true "Output of screen")
When you access your website through a browser, the default NGINX website should appear:
![Alt text](Tutorial_Pictures/installDependanciesNGINX.png?raw=true "Output of screen")
2. dashboardBuild.sh - This will create the production build of your app. Pass your foldername as an argument.
3. nginx_setup.sh - This will install nginx and set the system configs to proxy properly
4. nginx_dashboard.sh - This will configure nginx to host your project in the /dashboard directory of your site
