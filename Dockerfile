FROM vimagick/mantisbt:latest

# Variables de entorno (Railway las inyecta)
ENV DB_TYPE=mysqli
ENV DB_HOST=${MYSQLHOST}
ENV DB_NAME=${MYSQLDATABASE}
ENV DB_USER=${MYSQLUSER}
ENV DB_PASSWORD=${MYSQLPASSWORD}

# Crear config_inc.php automáticamente
RUN mkdir -p /var/www/html/config

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
