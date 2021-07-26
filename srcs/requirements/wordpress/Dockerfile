FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN mkdir /run/php
RUN apt-get update &&\
	apt-get -y install php7.3-fpm php7.3-mysql php7.3-mbstring &&\
	apt-get -y install wget &&\
	wget https://wordpress.org/latest.tar.gz -O - | tar -xzC /
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	#php wp-cli.phar config create --dbname=wordpress --dbuser=root --allow-root --path="/wordpress/" &&\
	#rm wp-cli.phar
CMD /usr/sbin/php-fpm7.3 -F -R
