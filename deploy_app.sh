#!/bin/bash
set -e

APP_SOURCE="/home/ec2-user/app"
WEB_ROOT="/usr/share/nginx/html"

echo "Starting deployment..."

# 1. Ensure app directory exists
if [ ! -d "$APP_SOURCE" ]; then
  echo "ERROR: App directory not found!"
  exit 1
fi

# 2. Install Nginx if missing
if ! command -v nginx >/dev/null 2>&1; then
  echo "Installing Nginx..."
  sudo yum install -y nginx
fi

# 3. Deploy website
sudo rm -rf ${WEB_ROOT}/*
sudo cp -r ${APP_SOURCE}/* ${WEB_ROOT}/
sudo chown -R nginx:nginx ${WEB_ROOT} || sudo chown -R www-data:www-data ${WEB_ROOT}
sudo chmod -R 755 ${WEB_ROOT}

# 4. Start or reload Nginx
if ! pgrep nginx >/dev/null 2>&1; then
  echo "Starting Nginx..."
  sudo nginx
else
  echo "Reloading Nginx..."
  sudo nginx -s reload
fi

# 5. Verify Nginx is running
pgrep -a nginx && echo "Nginx is running."
echo "Deployment complete!"

