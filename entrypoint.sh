#!/bin/bash

cat <<EOF > /var/www/html/config/config_inc.php
<?php
    \$g_hostname = '${DB_HOST}';
    \$g_db_type = '${DB_TYPE}';
    \$g_database_name = '${DB_NAME}';
    \$g_db_username = '${DB_USER}';
    \$g_db_password = '${DB_PASSWORD}';
    \$g_db_port = ${DB_PORT};

    \$g_default_timezone = 'America/Bogota';
    \$g_crypto_master_salt = '$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 30)';

    \$g_allow_signup = ON;
    \$g_admin_checks = OFF;
?>
EOF

apache2-foreground
