FROM alpine:3.12.0

RUN apk add --no-cache mysql mysql-client

COPY init_db.sh 	/root/
COPY start.sh 		/usr/sbin/
COPY wordpress.sql 	/root/wordpress.sql
EXPOSE 3306

ENTRYPOINT ["usr/sbin/start.sh"]
