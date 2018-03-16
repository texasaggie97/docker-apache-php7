FROM ubuntu:17.10

# Originally from https://github.com/bylexus/docker-apache-php7
# MAINTAINER Alexander Schenkel <alex@alexi.ch>
MAINTAINER Mark Silva <github@markesilva.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.1 \
      php7.1-cli \
      libapache2-mod-php7.1 \
      php-apcu \
      php-xdebug \
      php7.1-gd \
      php7.1-json \
      php7.1-ldap \
      php7.1-mbstring \
      php7.1-mysql \
      php7.1-pgsql \
      php7.1-sqlite3 \
      php7.1-xml \
      php7.1-xsl \
      php7.1-zip \
      php7.1-soap \
      php7.1-opcache \
      composer

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
