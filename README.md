# FullDeployment
This repo contains shell script that will help you deploy your frontend website on a digital ocean server using NGINX.
Run each file using sh. For example to run the installDependancies.sh file, type in you terminal `sh installDependancies.sh

I make references to my react app mk_dashboard which you can check out here: https://github.com/Zartinad/mk_dashboard`

# 1.Clone the Repository
    1. git clone https://github.com/Zartinad/FullDeployment.git
    2. cd FullDeployment
# 2.Install Dependancies
    1. sh installDependancies.sh
# 3.Clone React , Frontend, Backend Files
    1. git clone https://github.com/MarkdaleMGMT/frontend-app.git
    2. git clone https://github.com/MarkdaleMGMT/transaction-methods.git
    3. git clone https://github.com/MarkdaleMGMT/frontend-server.git

    * [Optional] Make sure that each repo is on the correct branch i.e: 
        *cd frontend-app
        *git checkout develop
# 4.Deploy Front-End React 
    1. sh dashboardBuild.sh [react-folder]
        *For example with react folder frontend-app: sh dashboardBuild.sh frontend-app
    2. sh nginxConfig.sh [react-folder]
# 5.Deploy MySQL and PhpMyAdmin
    1. sh installMySQL.sh
        *It will prompt you to enter a root and app password for mysql
    2. sh installphpMyAdmin.sh
        *It will prompt you to enter a password for phpmyadmin