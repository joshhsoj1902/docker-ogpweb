#!/bin/bash

if [ -z "$OGP_INSTALL" ] || [ $OGP_INSTALL = 'false' ]; then
  echo "Starting OGP web"

  rm /var/www/html/install.php
  /usr/local/bin/gomplate -f /var/templates/config.inc.php.tmpl -o /var/www/html/includes/config.inc.php
else
  echo "Running in install mode"

  touch /var/www/html/includes/config.inc.php
  chmod 777 /var/www/html/includes/config.inc.php
  cp /var/www/html/install.php.bac /var/www/html/install.php
fi


./my_init
