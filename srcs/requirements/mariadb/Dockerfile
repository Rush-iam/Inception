FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update

RUN apt-get -y install mariadb-server
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

CMD mysqld_safe
