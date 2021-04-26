#!/bin/sh


mv /var/www/phpmyadmin/phpMyAdmin-5.0.4-all-languages.tar.gz /var/www/phpmyadmin/phpmyadmin.tar.gz
tar -xvf /var/www/phpmyadmin/phpmyadmin.tar.gz

rm /var/www/phpmyadmin/phpmyadmin.tar.gz
#sed s/localhost/$WP_DB_HOST/g /var/www/phpmyadmin/config.sample.inc.php > /var/www/phpmyadmin/config.inc.php
#echo "\$cfg['PmaAbsoluteUri'] = './';" >> /var/www/phpmyadmin/config.inc.php


# ssl certificate
# Create ssl certificate
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#    -subj "/C=FR/ST=75/L=Paris/O=42/CN=tvideira"    \
#    -keyout /etc/ssl/private/nginx-selfsigned.key   \
#    -out /etc/ssl/certs/nginx-selfsigned.crt

# Create this directory or change it in configs order to launch nginx
#mkdir -p /run/nginx

#mkdir -p /etc/telegraf
#telegraf -sample-config --input-filter cpu:mem:net:swap:diskio --output-filter influxdb > /etc/telegraf/telegraf.conf
#sed -i s/'# urls = \["http:\/\/127.0.0.1:8086"\]'/'urls = ["http:\/\/influxdb:8086"]'/ /etc/telegraf/telegraf.conf
#sed -i s/'# database = "telegraf"'/'database = "phpmyadmin"'/ /etc/telegraf/telegraf.conf
#sed -i s/'omit_hostname = false'/'omit_hostname = true'/ /etc/telegraf/telegraf.conf

# Start nginx
nginx
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start nginx: $status"
	exit $status
fi


 Start php-fpm7
php-fpm7
status=$?
if [ $status -ne 0 ];
then
	echo "Failed to start php-fpm7: $status"
	exit $status
fi


tail -f /dev/null

# Start telegraf
#telegraf &

#while sleep 60; do
#    ps aux |grep nginx |grep -q -v grep
#     PROCESS_1_STATUS=$?
#     ps aux |grep php-fpm |grep -q -v grep
#    PROCESS_2_STATUS=$?
#    ps aux |grep telegraf |grep -q -v grep
#    PROCESS_3_STATUS=$?
#    if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 -o $PROCESS_3_STATUS -ne 0 ];
#    then
#        echo "One of the processes has already exited."
#        exit 1
#    fi
#done
