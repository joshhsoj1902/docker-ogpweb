FROM nimmis/apache-php5 

MAINTAINER joshhsoj1902 

RUN apt-get update
RUN apt-get install -y php5-mysql subversion php5-xmlrpc php-pear 

RUN svn co svn://svn.code.sf.net/p/hldstart/svn/trunk/upload/ ~/public_html/ogp \
    && rm -rf /var/www/html \
    && cp -rp ~/public_html/ogp /var/www/html

RUN touch /var/www/html/includes/config.inc.php \
    && chmod -R 777 /var/www/html/includes/config.inc.php \
    && chmod -R 777 /var/www/html/modules/TS3Admin/templates_c

EXPOSE 80
