#!/bin/bash

########################
# nginx
########################
echo "Installing nginx"
sudo apt-get -y install nginx
sudo service nginx start

########################
# Configuring nginx
########################
echo "Configuring nginx"
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo service nginx restart
echo "Success"

########################
# PgHero
########################
wget -qO- https://dl.packager.io/srv/pghero/pghero/key | sudo apt-key add -
sudo wget -O /etc/apt/sources.list.d/pghero.list \
  https://dl.packager.io/srv/pghero/pghero/master/installer/ubuntu/16.04.repo
sudo apt-get update
sudo apt-get -y install pghero

########################
# PgHero Configuration
########################
sudo pghero config:set DATABASE_URL=postgres://postgres:postgres@10.0.2.2:5432/pg_test
sudo pghero config:set PORT=3001
sudo pghero config:set RAILS_LOG_TO_STDOUT=disabled
sudo pghero scale web=1
sudo service pghero restart
