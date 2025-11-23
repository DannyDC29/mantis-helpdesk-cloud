# Usamos la imagen de MantisBT
FROM vimagick/mantisbt:latest

# Configuración para SQLite
ENV DB_TYPE=mysqli
ENV DB_HOST=mysql
ENV DB_NAME=railway
ENV DB_USER=root
ENV DB_PASSWORD=wapQVAmqRtABsoRrdWLQwMZwdwIxvNtT

# Exponemos el puerto 80
EXPOSE 80

# Comando para iniciar Mantis
CMD ["apache2-foreground"]