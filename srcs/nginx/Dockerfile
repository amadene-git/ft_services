FROM alpine:3.12.0

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

COPY start.sh /usr/sbin/start.sh
COPY default.conf /etc/nginx/conf.d/


ENTRYPOINT ["/usr/sbin/start.sh"]

EXPOSE 80
EXPOSE 443

