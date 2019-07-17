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
3. nginxConfig.sh - This will create a NGINX config file called main that would allow people to access the dashboard. Your react folder will also be copied /var/www/

    Run the command as `sh nginxConfig.sh [ipAddress] [dashboardFolder]` where `[ipAddress]` and `[dashboardFolder]`. 
    For example, `sh nginxConfig.sh 165.227.35.11 mk_dashboard`

    ![Alt text](Tutorial_Pictures/nginxConfig.png?raw=true "Output of screen")

    Note: The lines below is no sign of concern. They will only appear when you run the script multiple times
    ```
    ln: failed to create symbolic link '/etc/nginx/sites-enabled/main': File exists
    unlink: cannot unlink '/etc/nginx/sites-enabled/default': No such file or directory
    ```
