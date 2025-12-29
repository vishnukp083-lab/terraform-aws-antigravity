#!/bin/bash

set -e

APP_SOURCE="/home/ec2-user/app"
WEB_ROOT="/usr/share/nginx/html"

echo "Starting application deployment..."

# 0. Update system and install nginx if not installed
if ! command -v nginx &> /dev/null; then
  echo "Nginx not found. Installing..."
  sudo yum update -y
  sudo amazon-linux-extras enable nginx1 -y
  sudo yum install nginx -y
fi

# 1. Start nginx if not running
if ! systemctl is-active --quiet nginx; then
  sudo systemctl enable nginx
  sudo systemctl start nginx
fi

# 2. Check if app directory exists
if [ ! -d "$APP_SOURCE" ]; then
  echo "ERROR: Application directory not found!"
  exit 1
fi

# 3. Clear old website files
sudo rm -rf ${WEB_ROOT}/*

# 4. Copy new website files
sudo cp -r ${APP_SOURCE}/* ${WEB_ROOT}/

# 5. Set correct permissions
sudo chown -R nginx:nginx ${WEB_ROOT}
sudo chmod -R 755 ${WEB_ROOT}

# 6. Restart nginx to pick up changes
sudo systemctl restart nginx

echo "Deployment completed successfully!"

