# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngragas <ngragas@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/28 18:54:01 by ngragas           #+#    #+#              #
#    Updated: 2021/07/28 20:01:01 by ngragas          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception
NAME_LOWER = $(shell echo $(NAME) | tr A-Z a-z)
SRCS = srcs/
DATA_DIR = /home/ngragas/data
DATA_DB_DIR = $(DATA_DIR)/db
DATA_WP_DIR = $(DATA_DIR)/wordpress

all: up
$(DATA_DB_DIR):
	mkdir -p $@
$(DATA_WP_DIR):
	mkdir -p $@
up: | $(DATA_DB_DIR) $(DATA_WP_DIR)
	cd $(SRCS) && docker-compose -p "$(NAME)" up -d && \
	docker exec $(NAME_LOWER)_wordpress_1 /bin/sh -c /init.sh
	chmod 777 /etc/hosts
	echo "127.0.0.1 ngragas.42.fr" >> /etc/hosts
	chmod 644 /etc/hosts
start:
	cd $(SRCS) && docker-compose -p "$(NAME)" up -d
stop:
	cd $(SRCS) && docker-compose -p "$(NAME)" stop
clean:
	cd $(SRCS) && docker-compose -p "$(NAME)" rm -f -s
fclean:
	cd $(SRCS) && docker-compose -p "$(NAME)" down --rmi all -v
	rm -rf $(DATA_DIR)
re: fclean all
.PHONY: up start stop clean fclean re

