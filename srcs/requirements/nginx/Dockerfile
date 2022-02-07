FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update

RUN apt-get -y install nginx-light openssl
RUN rm /etc/nginx/sites-enabled/default
COPY conf/inception.conf /etc/nginx/conf.d/inception.conf

ARG DOMAIN_NAME
RUN openssl req -x509 -nodes -days 365 -newkey rsa \
    -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21 School/CN=$DOMAIN_NAME"

EXPOSE 443
CMD nginx -g "daemon off;"
