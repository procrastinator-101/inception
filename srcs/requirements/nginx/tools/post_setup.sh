#!/bin/bash

# ======================= setting https up ======================= #
# ================================================================ #

cp -p $NGINX_SSL_KEY /etc/ssl/private/
cp -p $NGINX_SSL_CRT /etc/ssl/certs/

chown 400 /etc/ssl/private/
echo -e "\n\e[32mDone Setting HTTPS\e[0m\n"


# =================== organising served content ================== #
# ================================================================ #

cp /conf/nginx.conf /etc/nginx/
cp /conf/default.conf /etc/nginx/conf.d/

rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*

echo -e "\n\e[32mDone Configuring Nginx\e[0m\n"


# ======================= starting nginx ========================= #
# ================================================================ #

service nginx start

sleep 3500