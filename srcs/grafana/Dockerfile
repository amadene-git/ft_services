FROM alpine:3.12.0

RUN  apk add --no-cache grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY start.sh	/usr/sbin/start.sh

CMD ["/usr/sbin/start.sh"]
