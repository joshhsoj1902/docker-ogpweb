FROM nimmis/apache-php5

RUN apt-get update
RUN apt-get install -y php5-mysql php5-xmlrpc php-pear

RUN curl -sSLf -z /usr/local/bin/gomplate -o /usr/local/bin/gomplate https://github.com/hairyhenderson/gomplate/releases/download/v2.0.0/gomplate_linux-amd64-slim \
  && chmod 755 /usr/local/bin/gomplate

RUN wget -P ~/public_html https://github.com/OpenGamePanel/OGP-Website/archive/901eb3b8b0742c1f789fc78da32d57a62f0a2540.zip \
  && unzip ~/public_html/901eb3b8b0742c1f789fc78da32d57a62f0a2540.zip -d ~/public_html \
  && rm -rf /var/www/html \
  && cp -rp ~/public_html/OGP-Website-901eb3b8b0742c1f789fc78da32d57a62f0a2540 /var/www/html \
  && rm -rf ~/public_html

COPY templates /var/templates
ADD docker-runner.sh docker-health.sh installer.sh was-installer-removed.sh /

RUN chmod +x /installer.sh /was-installer-removed.sh

RUN chmod -R 777 /var/www/html/modules/TS3Admin/templates_c /docker-health.sh
RUN mv /var/www/html/install.php /var/www/html/install.php.bac

WORKDIR /

HEALTHCHECK --start-period=45s CMD /docker-health.sh

CMD ["sh", "/docker-runner.sh"]
