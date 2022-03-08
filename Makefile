Author = younes


NGINX_SRC_PATH = srcs/requirements/nginx
MARIADB_SRC_PATH = srcs/requirements/mariadb
WORDPRESS_SRC_PATH = srcs/requirements/wordpress


NGINX_CONF_SRC = $(NGINX_SRC_PATH)/conf/default.conf \
				 $(NGINX_SRC_PATH)/conf/fastcgi_params \
				 $(NGINX_SRC_PATH)/conf/nginx.conf \
				 $(NGINX_SRC_PATH)/conf/nginx-selfsigned.crt \
				 $(NGINX_SRC_PATH)/conf/nginx-selfsigned.key

NGINX_TOOLS_SRC = $(NGINX_SRC_PATH)/tools/default_setup.sh \
				  $(NGINX_SRC_PATH)/tools/post_setup.sh

NGINX_SRC = $(NGINX_SRC_PATH)/Dockerfile $(NGINX_CONF_SRC) $(NGINX_TOOLS_SRC)


MARIADB_CONF_SRC = $(MARIADB_SRC_PATH)/conf/mysql_secure_installation.exp

MARIADB_TOOLS_SRC = $(MARIADB_SRC_PATH)/tools/default_setup.sh \
					$(MARIADB_SRC_PATH)/tools/post_setup.sh

MARIADB_SRC = $(MARIADB_SRC_PATH)/Dockerfile $(MARIADB_CONF_SRC) $(MARIADB_TOOLS_SRC)


WORDPRESS_CONF_SRC = $(WORDPRESS_SRC_PATH)/conf/wp-config.php

WORDPRESS_TOOLS_SRC = $(WORDPRESS_SRC_PATH)/tools/default_setup.sh \
					  $(WORDPRESS_SRC_PATH)/tools/post_setup.sh

WORDPRESS_SRC = $(WORDPRESS_SRC_PATH)/Dockerfile $(WORDPRESS_CONF_SRC) $(WORDPRESS_TOOLS_SRC)

SRC = srcs/docker-compose.yml $(NGINX_SRC) $(MARIADB_SRC) $(WORDPRESS_SRC)


all : $(SRC)
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker volume rm DB WordPress

re: fclean all

.PHONY : all clean fclean re