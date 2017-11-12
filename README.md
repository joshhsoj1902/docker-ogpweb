# docker-ogpweb

## How to Run

 - The `docker-compose.yml` included in this project is a great place to start
 - Change passwords set in environment variables 
 - Launch docker containers
   `docker-compose up`
 - Once launched the server is available on port 10001
   `localhost:10001` (this ca be changed in the docker-compose file)
 - sign in using the admin user and password set in the docker-compose file.
 - After you've signing in once, set the `OGP_INSTALL` environment vairable to `FALSE`.

