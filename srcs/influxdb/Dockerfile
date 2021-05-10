FROM alpine:3.12.0

RUN apk add --no-cache influxdb

COPY start.sh 		/usr/sbin/start.sh
COPY influxdb.conf	/etc/influxdb.conf

EXPOSE 8086

CMD ["/usr/sbin/start.sh"]
