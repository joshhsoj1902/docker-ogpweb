FROM nimmis/apache-php5

MAINTAINER joshhsoj1902

RUN apt-get update
RUN apt-get install -y php5-mysql php5-xmlrpc php-pear

RUN wget -P ~/public_html https://github.com/OpenGamePanel/OGP-Website/archive/master.zip \
  && unzip ~/public_html/master.zip -d ~/public_html \
  && rm -rf /var/www/html \
  && cp -rp ~/public_html/OGP-Website-master /var/www/html

#ADD config.inc.php /var/www/html/includes
RUN mkdir /var/www/html/includes/config \
    && touch /var/www/html/includes/config/config.inc.php \
    && chmod -R 777 /var/www/html/includes/config/config.inc.php \
    && ln -s /var/www/html/includes/config/config.inc.php /var/www/html/includes/config.inc.php \
    && chmod -R 777 /var/www/html/modules/TS3Admin/templates_c

EXPOSE 80
