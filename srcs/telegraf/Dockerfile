FROM alpine:3.12.0
RUN apk add --no-cache wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz\
	&& tar -xvf telegraf-1.17.2_linux_amd64.tar.gz\
	&& mkdir -p /etc/telegraf\
	&& mkdir =p /lib64\
	&& cp /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY start.sh /usr/sbin/start.sh

EXPOSE 8125

CMD ["/usr/sbin/start.sh"]