FROM php:8.2-apache

# Instalar dependencias
RUN apt-get update && apt-get install -y unzip curl libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Descargar MantisBT
RUN curl -L -o /tmp/mantis.zip https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.26.2/mantisbt-2.26.2.zip \
    && unzip /tmp/mantis.zip -d /var/www/html \
    && mv /var/www/html/mantisbt-2.26.2/* /var/www/html/ \
    && rm -rf /tmp/mantis.zip /var/www/html/mantisbt-2.26.2

# Copiar archivos de configuración
COPY config_inc.php /var/www/html/config/config_inc.php
COPY testdb.php /var/www/html/testdb.php

# Permisos correctos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
