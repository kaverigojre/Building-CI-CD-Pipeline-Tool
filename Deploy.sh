#!/bin/bash

# GitHub repository information
repo_url="https://github.com/your_username/your_repository.git"

# Local directory to clone the repository
local_dir="/path/to/local/directory"

# Nginx restart command
nginx_restart_command="sudo service nginx restart"

# Backup the current Nginx configuration (optional)
nginx_config_backup_dir="/path/to/nginx/config/backup"
mkdir -p "$nginx_config_backup_dir"
cp /etc/nginx/nginx.conf "$nginx_config_backup_dir/nginx.conf_$(date +'%Y%m%d%H%M%S')"

# Clone the latest code
git clone "$repo_url" "$local_dir"

# Check if the clone was successful
if [ $? -eq 0 ]; then
    echo "Code cloned successfully."

    # Restart Nginx
    echo "Restarting Nginx..."
    $nginx_restart_command

    # Check if Nginx restart was successful
    if [ $? -eq 0 ]; then
        echo "Nginx restarted successfully."
    else
        echo "Error: Failed to restart Nginx."
    fi
else
    echo "Error: Failed to clone the code."
fi
