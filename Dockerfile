# Usamos la imagen de MantisBT
FROM vimagick/mantisbt:latest

# Configuración para SQLite
ENV DB_TYPE=sqlite
ENV DB_NAME=/data/mantis.db

# Exponemos el puerto 80
EXPOSE 80

# Comando para iniciar Mantis
CMD ["apache2-foreground"]