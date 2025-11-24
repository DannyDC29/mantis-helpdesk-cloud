FROM vimagick/mantisbt:latest

ENV DB_TYPE=mysqli

# VARIABLES QUE VIENEN DE RAILWAY
ENV DB_HOST=${MYSQLHOST}
ENV DB_PORT=${MYSQLPORT}
ENV DB_NAME=${MYSQLDATABASE}
ENV DB_USER=${MYSQLUSER}
ENV DB_PASSWORD=${MYSQLPASSWORD}

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
CMD ["/entrypoint.sh"]
