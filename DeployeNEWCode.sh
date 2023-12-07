#!/bin/bash



DEPLOY_DIR="/var/www/html" #code will be deployed here

GIT_REPO="https://github.com/kaverigojre/Building-CI-CD-Pipeline-Tool"


BRANCH="main" #git branch

#Nginx configuration file

NGINX_CONF="C:\Users\Kaver\Downloads\nginx\nginx-1.24.0\conf" #My Nginx conf file


updating_code()  
{ #fuction to update the existing code


    echo "Updating code from Git repo"
    cd $DEPLOY_DIR || exit
    git pull origin $BRANCH
}



restarting_nginx() 
{
    # Function to restart Nginx
    echo "Restarting Nginx..."
    sudo systemctl restart nginx
}



# updating the Git repository
if [ -d "$DEPLOY_DIR" ]; then
    update_code
else
    git clone -b $BRANCH $GIT_REPO $DEPLOY_DIR
fi

updating_code
restarting_nginx
echo "Deployment completed successfully!"
