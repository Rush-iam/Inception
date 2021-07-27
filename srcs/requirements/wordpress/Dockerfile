FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get -y install php7.3-fpm php7.3-mysql php7.3-mbstring php7.3-gd
RUN	apt-get -y install wget &&\
	wget https://wordpress.org/latest.tar.gz -O - | tar -xzC /
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	php wp-cli.phar config create --dbname=wordpress --dbuser=root --dbhost=mariadb --allow-root --skip-check --path=/wordpress/ &&\
	php wp-cli.phar user create ngragas ngragas@42.fr --user_pass=ngragas --role=administrator --allow-root --path=/wordpress &&\
	php wp-cli.phar user create UserName user@user.us --user_pass=UserPass --allow-root --path=/wordpress &&\
	rm wp-cli.phar
RUN mkdir /run/php &&\
	mkdir /var/www &&\
	ln -s /wordpress /var/www/html &&\
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" \
			/etc/php/7.3/fpm/pool.d/www.conf

CMD php-fpm7.3 -F
