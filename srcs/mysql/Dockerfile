FROM alpine:3.12.0

RUN apk add --no-cache mysql mysql-client

COPY init_db.sh .
COPY start.sh 	/usr/sbin/

ENTRYPOINT ["usr/sbin/start.sh"]
