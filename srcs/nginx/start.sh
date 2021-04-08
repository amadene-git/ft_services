#!/bin/sh


mkdir -p /run/nginx
mkdir -p /var/www/html


echo "salut" > /var/www/html/index.html

#nginx

#sh
#tail -f /dev/null


nginx -g 'daemon off;'
