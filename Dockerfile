FROM mantisbt/mantisbt:latest

# Copiar archivo de configuración personalizado
COPY config/config_inc.php /var/www/html/config/config_inc.php

# Permisos correctos para que Mantis lo lea
RUN chown www-data:www-data /var/www/html/config/config_inc.php \
    && chmod 640 /var/www/html/config/config_inc.php

EXPOSE 80
