FROM debian:buster
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update

RUN apt-get -y install redis-server

RUN echo "echo 1 > /proc/sys/vm/overcommit_memory\n\
    echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled\n\
    redis-server --protected-mode no" > /start_redis.sh &&\
    chmod +x /start_redis.sh

CMD /start_redis.sh
