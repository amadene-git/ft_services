#!/bin/sh

mv /var/www/phpMyAdmin-5.0.4-all-languages.tar.gz /var/www/phpmyadmin.tar.gz
tar -xvf /var/www/phpmyadmin.tar.gz
rm /var/www/phpmyadmin.tar.gz
mv phpMyAdmin-5.0.4-all-languages/ phpmyadmin
mv /root/config.inc.php  /var/www/phpmyadmin/config.inc.php
rm -rf /var/www/phpmyadmin/config.sample.inc.php
 
echo "\$cfg['PmaAbsoluteUri'] = './';" >> /var/www/phpmyadmin/config.inc.php


openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=75/L=Paris/O=42/CN=amadene"    \
    -keyout /etc/ssl/private/nginx-selfsigned.key   \
    -out /etc/ssl/certs/nginx-selfsigned.crt

mkdir -p /run/nginx


nginx
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start nginx: $status"
	exit $status
fi


php-fpm7
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start php-fpm7: $status"
	exit $status
fi


while sleep 60; do
    ps aux |grep nginx |grep -q -v grep
     PROCESS_1_STATUS=$?
    ps aux |grep php-fpm |grep -q -v grep
    PROCESS_2_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
