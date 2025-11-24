FROM php:7.4-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get update && apt-get install -y unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/mantis.zip https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.26.2/mantisbt-2.26.2.zip \
    && unzip /tmp/mantis.zip -d /var/www/html \
    && mv /var/www/html/mantisbt-2.26.2/* /var/www/html/ \
    && rm -rf /tmp/mantis.zip /var/www/html/mantisbt-2.26.2 \
    && chown -R www-data:www-data /var/www/html

COPY config_inc.php /var/www/html/config/config_inc.php

EXPOSE 80
