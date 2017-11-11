#!/bin/bash

database_host=${MYSQL_IP:-my_db}
database_user=${MYSQL_USER:-ogpuser}
database_pass=${MYSQL_PASS}
database_name=${MYSQL_DBNAME:-opengamepanel}
database_prefix=${MYSQL_PREFIX:-_ogb}

admin_username=${ADMIN_USERNAME}
admin_password=${ADMIN_PASSWORD}
admin_email=${ADMIN_EMAIL}


if [ -z "$OGP_INSTALL" ] || [ $OGP_INSTALL = 'false' ]; then
  echo "Not in INSTALL mode"
else
  echo "Running in install mode"

  sleep 15 #Give the db container time to start up
  timeout 60s sh -c 'until [ -n "$(curl -ks --head http://localhost)" ]; do echo "waiting for service to start"; sleep 1; done'

  #Setup tables
  curl --data "db_host=$database_host&db_user=$database_user&db_pass=$database_pass&db_name=$database_name&table_prefix=$database_prefix&next=next" http://localhost/install.php?step=2
  sleep 2

  #Setup Admin user
  #TODO: we could also do some DB checks BEFORE we do this.
  curl --data "step=3&username=$admin_username&password1=$admin_password&password2=$admin_password&email=$ADMIN_EMAIL&next=next" http://localhost/install.php?step=2

  sleep 2

  if curl -v --silent --data "lang=-&ulogin=$admin_username&upassword=$admin_password&login=Login" http://localhost/index.php 2>&1 | grep -q 'Invalid username or password'; then
    echo "Login failed. Auto Install likely failed"
    exit 1
    echo "Done Grepping 1" 
  fi

  mv /var/www/html/install.php /var/www/html/install.php.bac

  #TODO: Shuld we also insert the agent?

  echo "Done installing"

fi