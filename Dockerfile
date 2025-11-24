FROM vimagick/mantisbt:latest

ENV DB_TYPE=mysqli
ENV DB_HOST=yamabiko.proxy.rlwy.net
ENV DB_PORT=43656
ENV DB_NAME=railway
ENV DB_USER=root
ENV DB_PASSWORD=RvyyjdRVXfXpaiPoKtnqzznNKDWFJnNZ

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
CMD ["/entrypoint.sh"]
