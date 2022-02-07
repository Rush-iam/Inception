FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update

RUN apt-get -y install php7.3-fpm php-mysql
RUN mkdir /run/php &&\
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" \
			/etc/php/7.3/fpm/pool.d/www.conf

RUN	apt-get -y install wget &&\
    mkdir -p /adminer &&\
	wget https://www.adminer.org/latest-mysql-en.php -O /adminer/index.php

CMD php-fpm7.3 -F
