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


# ======================= Configuring Nginx ===================== #
# ================================================================ #

cp -f /conf/nginx.conf /etc/nginx/
cp -f /conf/default.conf /etc/nginx/conf.d/
cp -f /conf/fastcgi_params /etc/nginx/

rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*

echo -e "\n\e[32mNginx\t\t\t\t\tconfigured\e[0m\n"


# ================== setting https credentials =================== #
# ================================================================ #

cp -p /conf/nginx-selfsigned.key /etc/ssl/private/
cp -p /conf/nginx-selfsigned.crt /etc/ssl/certs/

echo -e "\n\e[32mHttps\t\t\t\t\tset up\e[0m\n"


# ================= changing ssl keys ownership ================== #
# ================================================================ #

chmod -R 400 /etc/ssl/private/
echo -e "\n\e[32mDone changing ssl Keys ownership\e[0m\n"

echo "abc" >> file.txt
chmod 500 file.txt

# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /conf
