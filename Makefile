Author = younes


MAC_VOLUMES_PATH = /goinfre/yarroubi/dockerSharedFiles
UBUNTU_VOLUMES_PATH = /home/yarroubi/data

VOLUMES_PATH = $(UBUNTU_VOLUMES_PATH)

NGINX_SRC_PATH = srcs/requirements/nginx
MARIADB_SRC_PATH = srcs/requirements/mariadb
WORDPRESS_SRC_PATH = srcs/requirements/wordpress


NGINX_CONF_SRC = $(NGINX_SRC_PATH)/conf/default.conf \
				 $(NGINX_SRC_PATH)/conf/fastcgi_params \
				 $(NGINX_SRC_PATH)/conf/nginx-selfsigned.crt \
				 $(NGINX_SRC_PATH)/conf/nginx-selfsigned.key \
				 $(NGINX_SRC_PATH)/conf/nginx.conf

NGINX_TOOLS_SRC = $(NGINX_SRC_PATH)/tools/default_setup.sh \
				  $(NGINX_SRC_PATH)/tools/post_setup.sh

NGINX_SRC = $(NGINX_SRC_PATH)/Dockerfile $(NGINX_CONF_SRC) $(NGINX_TOOLS_SRC)


MARIADB_CONF_SRC = $(MARIADB_SRC_PATH)/conf/50-server.cnf \
				   $(MARIADB_SRC_PATH)/conf/mysql_secure_installation.exp

MARIADB_TOOLS_SRC = $(MARIADB_SRC_PATH)/tools/default_setup.sh \
					$(MARIADB_SRC_PATH)/tools/post_setup.sh

MARIADB_SRC = $(MARIADB_SRC_PATH)/Dockerfile $(MARIADB_CONF_SRC) $(MARIADB_TOOLS_SRC)


WORDPRESS_CONF_SRC = $(WORDPRESS_SRC_PATH)/conf/wp-config.php \
					 $(WORDPRESS_SRC_PATH)/conf/www.conf

WORDPRESS_TOOLS_SRC = $(WORDPRESS_SRC_PATH)/tools/default_setup.sh \
					  $(WORDPRESS_SRC_PATH)/tools/post_setup.sh

WORDPRESS_SRC = $(WORDPRESS_SRC_PATH)/Dockerfile $(WORDPRESS_CONF_SRC) $(WORDPRESS_TOOLS_SRC)

SRC = srcs/docker-compose.yml srcs/.env $(NGINX_SRC) $(MARIADB_SRC) $(WORDPRESS_SRC)


all: build

build: volumes hosts $(SRC)
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

up: volumes hosts $(SRC)
	sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down

volumes:
	sudo mkdir -p $(VOLUMES_PATH)/DB
	sudo mkdir -p $(VOLUMES_PATH)/WordPress

hosts:
	sudo sed -i '/yarroubi.42.fr/d' /etc/hosts
	echo '127.0.0.1 yarroubi.42.fr' | sudo tee -a /etc/hosts

clean: down
	sudo docker volume rm -f DB WordPress
	sudo rm -rf $(VOLUMES_PATH)/*

fclean: clean
	sudo docker rmi -f $$(sudo docker images -q)
	sudo docker system prune -f

re: fclean all

.PHONY: all up build down volumes hosts clean fclean re