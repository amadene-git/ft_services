FROM alpine:3.12.0

RUN  apk add --no-cache grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY start.sh	/usr/sbin/start.sh
COPY grafana.db	/usr/share/grafana/data/grafana.db


CMD ["/usr/sbin/start.sh"]
