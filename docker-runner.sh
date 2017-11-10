#!/bin/bash

if [ -z "$MYSQL_IP" ]; then
  echo "Need to set MYSQL_IP environment"
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo "Need to set MYSQL_USER environment"
  exit 1
fi

if [ -z "$MYSQL_PASS" ]; then
  echo "Need to set MYSQL_PASS environment"
  exit 1
fi

if [ -z "$ADMIN_USERNAME" ]; then
  echo "Need to set ADMIN_USERNAME environment"
  exit 1
fi

if [ -z "$ADMIN_PASSWORD" ]; then
  echo "Need to set ADMIN_PASSWORD environment"
  exit 1
fi

if [ -z "$ADMIN_EMAIL" ]; then
  echo "Need to set ADMIN_EMAIL environment"
  exit 1
fi

# database_host=${MYSQL_IP:-my_db}
# database_user=${MYSQL_USER:-ogpuser}
# database_pass=${MYSQL_PASS}
# database_name=${MYSQL_DBNAME:-opengamepanel}
# database_prefix=${MYSQL_PREFIX:-_ogb}

# admin_username=${ADMIN_USERNAME}
# admin_password=${ADMIN_PASSWORD}
# admin_email=${ADMIN_EMAIL}






if [ -z "$OGP_INSTALL" ] || [ $OGP_INSTALL = 'false' ]; then
  echo "Starting OGP web"

  mv /var/www/html/install.php /var/www/html/install.php.bac
  /usr/local/bin/gomplate -f /var/templates/config.inc.php.tmpl -o /var/www/html/includes/config.inc.php
else
  echo "Running in install mode"

  /usr/local/bin/gomplate -f /var/templates/config.inc.php.tmpl -o /var/www/html/includes/config.inc.php


  touch /var/www/html/includes/config.inc.php
  chmod 777 /var/www/html/includes/config.inc.php
  cp /var/www/html/install.php.bac /var/www/html/install.php

  #run installer in background so that it happens after the webserver is up
  sh -c "./installer.sh" &

fi


./my_init

echo "HERE"