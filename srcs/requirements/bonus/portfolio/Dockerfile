FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update

RUN apt-get -y install nginx-light &&\
	rm /etc/nginx/sites-enabled/default
COPY conf/portfolio.conf /etc/nginx/conf.d/portfolio.conf

COPY website /portfolio
RUN chmod -R +r /portfolio

EXPOSE 80
CMD nginx -g "daemon off;"
