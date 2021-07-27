FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get -y install mariadb-server
COPY conf/my.cnf /etc/mysql/my.cnf

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WORDPRESS_DB_NAME
RUN service mysql start &&\
	echo "$MYSQL_USER $MYSQL_PASSWORD" &&\
	mysql -u root -e \
		"CREATE DATABASE wordpress; \
		CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
		UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root'; \
		UPDATE mysql.user SET Host='%' WHERE User='root'; \
		FLUSH PRIVILEGES;"

CMD mysqld_safe
