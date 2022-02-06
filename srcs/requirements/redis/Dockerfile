FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
	apt-get -y install redis-server

RUN echo "echo 1 > /proc/sys/vm/overcommit_memory\n\
    echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled\n\
    redis-server --protected-mode no" > /start_redis.sh &&\
    chmod +x /start_redis.sh

CMD /start_redis.sh
