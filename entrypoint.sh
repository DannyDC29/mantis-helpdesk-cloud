#!/bin/bash

cat <<EOF > /var/www/html/config/config_inc.php
<?php
\$g_hostname = getenv('DB_HOST');
\$g_db_type = 'mysqli';
\$g_database_name = getenv('DB_NAME');
\$g_db_username = getenv('DB_USER');
\$g_db_password = getenv('DB_PASSWORD');
\$g_db_port = getenv('DB_PORT');
\$g_default_timezone = 'America/Bogota';
?>
EOF

exec "$@"
