FROM mantisbt/mantisbt:latest

# Copiar configuración personalizada
COPY config_inc.php /var/www/html/config_inc.php
COPY testdb.php /var/www/html/testdb.php

# Ajustar permisos para que Apache/Mantis puedan acceder
RUN chown -R www-data:www-data /var/www/html
