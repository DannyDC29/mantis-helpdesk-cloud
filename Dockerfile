FROM php:8.1-apache

RUN docker-php-ext-install mysqli

RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*

# Descargar MantisBT
ADD https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.26.2/mantisbt-2.26.2.zip /tmp/mantis.zip
RUN unzip /tmp/mantis.zip -d /var/www/html/ && \
    mv /var/www/html/mantisbt-2.26.2/* /var/www/html && \
    rm -rf /var/www/html/mantisbt-2.26.2 /tmp/mantis.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
