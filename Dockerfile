FROM php:7.4-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Descargar MantisBT
RUN curl -L -o /tmp/mantis.zip https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.26.2/mantisbt-2.26.2.zip \
    && unzip /tmp/mantis.zip -d /var/www/html \
    && mv /var/www/html/mantisbt-2.26.2/* /var/www/html/ \
    && rm -rf /tmp/mantis.zip /var/www/html/mantisbt-2.26.2

# Permisos
RUN chown -R www-data:www-data /var/www/html

# Copiar entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
CMD ["/entrypoint.sh"]
