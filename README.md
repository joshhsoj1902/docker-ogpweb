# docker-ogpweb

## How to Run

 - Launch docker container
   `docker-compose up`
 - Once launched the server is available on port 80
   `localhost:80`
 - Walk through the install steps, when asking for the DB details use the following details (If you want to change any of these, they must be updated in .env)
   ```
   Database Hostname:  my_db
   Database Username:  ogpuser
   Database Password:  KwC6sXqAlTV
   Database Name:	   opengamepanel
   Database Prefix:    ogp_
   ```
 - Create an initial admin user with any details you wish
 - Lastly remove the intall.php file with the following command
   `docker exec -i -t dockerogpweb_web_1 rm /var/www/html/install.php`
