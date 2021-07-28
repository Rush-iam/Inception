FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get -y install mariadb-server
COPY conf/my.cnf /etc/mysql/my.cnf

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_DB_NAME
RUN service mysql start &&\
	mysql -u root -e \
	"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
	CREATE DATABASE $WP_DB_NAME; \
	GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$MYSQL_USER'@'%'; \
	FLUSH PRIVILEGES;"
#	\
#	INSERT INTO $WP_DB_NAME.wp_users (ID, user_login, user_pass, \
#	  user_nicename, user_email, user_url, user_registered, \
#	  user_activation_key, user_status, display_name) VALUES \
#	  ('2', '$WP_ADMIN_LOGIN', MD5('$WP_ADMIN_PASSWORD'), '', \
#	  '$WP_ADMIN_MAIL', '', '2021-07-28 00:00:00', '', '0', '$WP_ADMIN_LOGIN'); \
#	INSERT INTO '$WP_DB_NAME'.'wp_usermeta' \
#	  ('umeta_id', 'user_id', 'meta_key', 'meta_value') VALUES \
#	  (NULL, '2', 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'); \	
#	INSERT INTO '$WP_DB_NAME'.'wp_usermeta' \
#	  ('umeta_id', 'user_id', 'meta_key', 'meta_value') VALUES \
#	  (NULL, '2', 'wp_user_level', '10');"
#	\
#	INSERT INTO `$WP_DB_NAME`.`wp_users` (`ID`, `user_login`, `user_pass`, \
#	  `user_nicename`, `user_email`, `user_url`, `user_registered`, \
#	  `user_activation_key`, `user_status`, `display_name`) VALUES \
#	  ('3', '$WP_USER_LOGIN', MD5('$WP_USER_PASSWORD'), '', \
#	  '$WP_USER_MAIL', '', '2021-07-28 00:00:00', '', '0', '$WP_USER_LOGIN'); \
#	INSERT INTO `$WP_DB_NAME`.`wp_usermeta` \
#	  (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES \
#	  (NULL, '3', 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}');	\
#	INSERT INTO `$WP_DB_NAME`.`wp_usermeta` \
#	  (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES \
#	  (NULL, '3', 'wp_user_level', '0');"

CMD mysqld_safe
