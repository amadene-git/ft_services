FROM alpine:3.12.0


COPY start.sh /usr/sbin/start.sh
COPY default.conf /etc/nginx/conf.d/

RUN apk add vim
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

ENTRYPOINT ["/usr/sbin/start.sh"]

EXPOSE 80
EXPOSE 443

