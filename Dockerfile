# Usamos la imagen de MantisBT
FROM vimagick/mantisbt:latest

# Configuración para SQLite
ENV DB_TYPE=${DB_TYPE}
ENV DB_HOST=${MYSQLHOST}
ENV DB_NAME=${MYSQLDATABASE}
ENV DB_USER=${MYSQLUSER}
ENV DB_PASSWORD=${MYSQLPASSWORD}

# Exponemos el puerto 80
EXPOSE 80

# Comando para iniciar Mantis
CMD ["apache2-foreground"]