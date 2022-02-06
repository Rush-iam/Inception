FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
ARG DOMAIN_NAME
RUN apt-get update &&\
	apt-get -y install nginx-light openssl &&\
	openssl req -x509 -nodes -days 365 -newkey rsa -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21 School/CN=$DOMAIN_NAME"
RUN rm /var/www/html/index.nginx-debian.html
COPY conf/nginx_default /etc/nginx/sites-available/default

EXPOSE 443
CMD nginx -g "daemon off;"
