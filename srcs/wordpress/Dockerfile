FROM alpine:3.12.0

RUN apk add --no-cache nginx php-fpm php7-common php7-iconv       \
    php7-json php7-gd php7-curl php7-openssl php7-xml php7-mysqli php7-pdo      \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-mcrypt php7-gettext php7-ctype    \ 
    php7-dom php7 php7-phar

#RUN wget https://wordpress.org/wordpress-5.6.tar.gz   	&& \
#    tar -xzf wordpress-5.6.tar.gz                     	&& \
#    mv wordpress /var/www/                  			&& \
#    rm -rf wordpress-5.6.tar.gz

COPY default.conf  	/etc/nginx/conf.d/default.conf
COPY start.sh 		/usr/sbin/start.sh
COPY wordpress		/var/www/wordpress
CMD ["/usr/sbin/start.sh"]

