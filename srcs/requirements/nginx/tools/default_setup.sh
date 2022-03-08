#!/bin/bash

apt-get update

# ======================= installing Nginx ======================= #
# ================================================================ #

apt-get -y install nginx
echo -e "\n\e[32mnginx\t\t\t\t\tinstalled\e[0m\n"

# ============= installing Openssl to setup https ================ #
# ================================================================ #

apt-get -y install openssl
echo -e "\n\e[32mopenssl\t\t\t\t\tinstalled\e[0m\n"


# ================ installing some basic commands ================ #
# ================================================================ #

apt-get -y install vim
echo -e "\n\e[32mvim\t\t\t\t\tinstalled\e[0m\n"


# =================== adding https credentials =================== #
# ================================================================ #

cp -p $NGINX_SSL_KEY /etc/ssl/private/
cp -p $NGINX_SSL_CRT /etc/ssl/certs/

echo -e "\n\e[32mDone adding Https credentials\e[0m\n"


# ======================= Configuring Nginx ===================== #
# ================================================================ #

cp /conf/nginx.conf /etc/nginx/
cp /conf/default.conf /etc/nginx/conf.d/
cp /conf/fastcgi_params /etc/nginx/fastcgi_params

rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*

echo -e "\n\e[32mDone Configuring Nginx\e[0m\n"


# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /conf
