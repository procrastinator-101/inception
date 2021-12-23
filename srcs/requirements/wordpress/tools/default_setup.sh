#!/bin/bash

apt-get update

# ===================== installing wordpress ===================== #
# ================================================================ #

apt-get -y install wordpress
echo -e "\n\e[32mnginx\t\t\t\t\tinstalled\e[0m\n"

# ====================== installing php ========================== #
# ================================================================ #

apt-get -y install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
echo -e "\n\e[32mopenssl\t\t\t\t\tinstalled\e[0m\n"
