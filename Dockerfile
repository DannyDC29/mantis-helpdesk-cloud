FROM mantisbt/mantisbt:latest

ENV DB_TYPE=mysqli
ENV DB_HOST=mysql.railway.internal
ENV DB_NAME=railway
ENV DB_USER=root
ENV DB_PASSWORD=RvyyjdRVXfXpaiPoKtnqzznNKDWFJnNZ
ENV DB_PORT=3306

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
