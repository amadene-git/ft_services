#!/bin/sh

mkdir -p /run/nginx
mkdir -p /var/www/html

sed -i s/__IP_EXT__/$IP_EXT/g /etc/nginx/conf.d/default.conf

openssl req -x509 -nodes -days 365 \
	-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

echo "nginx server is ok" > /var/www/html/index.html

nginx -g 'daemon off;' &\
while sleep 60; do
    ps aux |grep nginx |grep -q -v grep
    PROCESS_1_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
