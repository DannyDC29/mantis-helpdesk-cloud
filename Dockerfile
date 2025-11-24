FROM vimagick/mantisbt:latest

# NO ponemos valores aquí, Railway los inyecta
ENV DB_TYPE=${DB_TYPE}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# BORRAR CONFIG ANTERIOR
RUN rm -f /var/www/html/config/config_inc.php

EXPOSE 80
CMD ["/entrypoint.sh"]
