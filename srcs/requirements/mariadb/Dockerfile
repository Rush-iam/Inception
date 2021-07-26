FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get -y install mariadb-server &&\
RUN mysql -u root -e \
		"CREATE DATABASE wordpress; \
		UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root'; \
		FLUSH PRIVILEGES;" &&\

CMD sh; sleep infinity
