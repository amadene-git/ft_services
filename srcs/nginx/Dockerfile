FROM alpine

RUN apk update
RUN apk add openrc --no-cache
RUN apk add vim
RUN apk add nginx


RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN  mkdir -p /run/nginx


COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY start.sh   /root/start.sh

EXPOSE 80 

ENTRYPOINT ["nginx", "-g", "daemon off;"]

