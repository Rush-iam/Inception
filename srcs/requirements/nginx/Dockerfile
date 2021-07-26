FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get -y install nginx-light openssl &&\
	openssl req -x509 -nodes -days 365 -newkey rsa -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21 School/CN=ngragas.42.fr"
COPY conf/nginx_default /etc/nginx/sites-available/default
EXPOSE 443
CMD nginx -g "daemon off;"
