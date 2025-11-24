#!/bin/bash

# Crear archivo config_inc.php basado en variables de entorno
cat <<EOF > /var/www/html/config/config_inc.php
<?php
\$g_hostname = '${DB_HOST}';
\$g_db_type = '${DB_TYPE}';
\$g_database_name = '${DB_NAME}';
\$g_db_username = '${DB_USER}';
\$g_db_password = '${DB_PASSWORD}';

# Opciones necesarias para producción en Railway
\$g_default_timezone       = 'America/Bogota';
\$g_crypto_master_salt     = '$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)';

# Crear usuario administrador por defecto
\$g_admin_checks = OFF;
?>
EOF

# Arrancar Apache
apache2-foreground
