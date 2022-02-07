FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update

RUN apt-get -y install php7.3-fpm php7.3-mysql php7.3-mbstring\
	php7.3-gd php7.3-curl php7.3-dom php7.3-imagick php7.3-zip php7.3-intl\
    php-redis
RUN mkdir /run/php &&\
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" \
			/etc/php/7.3/fpm/pool.d/www.conf

RUN	apt-get -y install wget &&\
	wget https://wordpress.org/latest.tar.gz --read-timeout=10 -O - | tar -xzC /
RUN	chown -R www-data:www-data /wordpress &&\
	chmod -R 775 /wordpress &&\
	usermod -aG root www-data &&\
	ln -s /wordpress /www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp &&\
	echo "path: /wordpress" > wp-cli.yml

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_DB_HOST
ARG WP_DB_NAME
RUN wp config create \
    --dbname="$WP_DB_NAME" --dbuser="$MYSQL_USER" \
	--dbpass="$MYSQL_PASSWORD" --dbhost="$WP_DB_HOST" \
	--allow-root --skip-check

ARG DOMAIN_NAME
ARG WP_SITE_TITLE
ARG WP_ADMIN_LOGIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER_LOGIN
ARG WP_USER_PASSWORD
ARG WP_USER_EMAIL
ARG WP_REDIS_HOST
RUN echo "wp core install --url=https://'$DOMAIN_NAME' --title='$WP_SITE_TITLE' --admin_user='$WP_ADMIN_LOGIN' --admin_password='$WP_ADMIN_PASSWORD' --admin_email='$WP_ADMIN_EMAIL' --allow-root \n\
	wp user create '$WP_USER_LOGIN' '$WP_USER_EMAIL' --user_pass='$WP_USER_PASSWORD' --allow-root \n\
    \n\
    wp plugin install redis-cache --activate --allow-root \n\
    wp config set 'WP_REDIS_HOST' '$WP_REDIS_HOST' --allow-root \n\
    wp redis enable --allow-root" > /init.sh &&\
    chmod +x /init.sh

CMD php-fpm7.3 -F
