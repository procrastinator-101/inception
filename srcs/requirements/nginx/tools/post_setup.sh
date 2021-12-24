#!/bin/bash

# ======================= setting https up ======================= #
# ================================================================ #

cp -p /tools/nginx-selfsigned.key /etc/ssl/private/
cp -p /tools/nginx-selfsigned.crt /etc/ssl/certs/
chown 400 /etc/ssl/private/
echo -e "\n\e[32mSetting HTTPS\t\t\t\t\tdone\e[0m\n"


# =================== organising served content ================== #
# ================================================================ #

cp /conf/nginx.conf /etc/nginx/
cp /conf/default.conf /etc/nginx/conf.d/

rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*

echo -e "\n\e[32mSetting Nginx Configuration\t\t\t\t\tdone\e[0m\n"


# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /tools /conf


# ======================= starting nginx ========================= #
# ================================================================ #

service nginx start