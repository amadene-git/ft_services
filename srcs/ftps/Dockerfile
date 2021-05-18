FROM alpine:3.12.0

RUN	 apk add --no-cache vsftpd openssl

RUN addgroup -g 1000 -S user
RUN adduser -u 1000 -D -G user -h /home/user -s /bin/false user
RUN chown user:user /home/user/ -R
RUN echo "user:1234" | /usr/sbin/chpasswd

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
	-newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key \
	-out /etc/ssl/certs/vsftpd-selfsigned.crt; 

COPY start.sh	/usr/sbin/start.sh
COPY vsftpd2.conf /etc/vsftpd/vsftpd.conf
COPY vsftpd.chroot_list /etc/vsftpd.chroot_list

EXPOSE	21 20 30100 30101 30102 30103 

CMD ["/usr/sbin/start.sh"]
