FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update

RUN apt-get -y install php7.3-fpm php-mysql
RUN	mkdir /run/php &&\
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" \
			/etc/php/7.3/fpm/pool.d/www.conf

ADD https://adminer.org/latest-mysql-en.php /adminer/index.php
ADD https://raw.githubusercontent.com/pepa-linha/Adminer-Design-Dark/master/adminer.css /adminer
RUN chmod -R +r /adminer

RUN sed -i "s/\"SERVER\",\$\_GET\[DRIVER\]/\"SERVER\",\"mariadb\"/" \
    		/adminer/index.php

CMD php-fpm7.3 -F
