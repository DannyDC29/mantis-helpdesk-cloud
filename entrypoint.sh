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
    \$g_crypto_master_salt = '7gT9Kx4Pq82LmD9QvH3S20rXpA';
    \$g_admin_checks = OFF;
?>
EOF

exec apache2-foreground
