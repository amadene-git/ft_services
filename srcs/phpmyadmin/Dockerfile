FROM alpine:3.12.0

RUN apk add --no-cache nginx php7 php7-fpm  php7-opcache \
php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json \
php7-session php7-bz2 php-zip openssl

WORKDIR /var/www/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz


COPY start.sh 		/usr/sbin/start.sh
COPY default.conf  	/etc/nginx/conf.d/default.conf
COPY config.inc.php /root/
COPY www.conf		/root/
EXPOSE 5000

ENTRYPOINT ["/usr/sbin/start.sh"]

