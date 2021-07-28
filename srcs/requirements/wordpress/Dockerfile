FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
	apt-get -y install php7.3-fpm php7.3-mysql php7.3-mbstring php7.3-gd
RUN mkdir /run/php &&\
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" \
			/etc/php/7.3/fpm/pool.d/www.conf
RUN	apt-get -y install wget &&\
	wget https://wordpress.org/latest.tar.gz -O - | tar -xzC / &&\
	mkdir /var/www &&\
	ln -s /wordpress /var/www/html

ARG DOMAIN_NAME
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_DB_HOST
ARG WP_DB_NAME
ARG WP_SITE_TITLE
ARG WP_ADMIN_LOGIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER_LOGIN
ARG WP_USER_PASSWORD
ARG WP_USER_EMAIL
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	php wp-cli.phar config create --dbname='$WP_DB_NAME' \
	  --dbuser='$MYSQL_USER' --dbpass='$MYSQL_PASSWORD' --dbhost='$WP_DB_HOST' \
	  --allow-root --skip-check --path=/wordpress/
RUN echo "php wp-cli.phar core install --url='$DOMAIN_NAME' --title='$WP_SITE_TITLE' --admin_user='$WP_ADMIN_LOGIN' --admin_password='$WP_ADMIN_PASSWORD' --admin_email='$WP_ADMIN_EMAIL' --path=/wordpress/ --allow-root \n\
	php wp-cli.phar user create '$WP_USER_LOGIN' '$WP_USER_EMAIL' --user_pass='$WP_USER_PASSWORD' --allow-root --path=/wordpress" >> /init.sh

CMD php-fpm7.3 -F
