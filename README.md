# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the installDependancies.sh file, type in you terminal `sh installDependancies.sh

I make references to my react app mk_dashboard which you can check out here: https://github.com/Zartinad/mk_dashboard`

# General Overview of Steps
0. `git clone [react-project]`
1. `sh installDependancies.sh`
2. `sh dashboardBuild.sh [react-folder]`
3. `sh nginxConfig.sh [ipAddress] [react-folder]`
