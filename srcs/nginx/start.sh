#!/bin/sh


mkdir -p /run/nginx
mkdir -p /var/www/html

openssl req -x509 -nodes -days 365 \
	-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;


echo "salut" > /var/www/html/index.html

#nginx

#sh
#tail -f /dev/null


nginx -g 'daemon off;'
