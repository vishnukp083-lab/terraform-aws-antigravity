#!/bin/bash

set -e

APP_SOURCE="/home/ec2-user/app"
WEB_ROOT="/usr/share/nginx/html"

echo "Starting application deployment..."

# 1. Check if app directory exists
if [ ! -d "$APP_SOURCE" ]; then
  echo "ERROR: Application directory not found!"
  exit 1
fi

# 2. Clear old website files
sudo rm -rf ${WEB_ROOT}/*

# 3. Copy new website files
sudo cp -r ${APP_SOURCE}/* ${WEB_ROOT}/

# 4. Set correct permissions
sudo chown -R nginx:nginx ${WEB_ROOT}
sudo chmod -R 755 ${WEB_ROOT}

# 5. Restart nginx
sudo systemctl restart nginx

echo "Deployment completed successfully!"
