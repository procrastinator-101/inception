#!/bin/bash

apt-get update

# ======================== installing curl ======================= #
# ================================================================ #

apt-get -y install curl
echo -e "\n\e[32mcurl\t\t\t\t\tinstalled\e[0m\n"


# ====================== installing php ========================== #
# ================================================================ #

apt-get -y install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
echo -e "\n\e[32mphp\t\t\t\t\tinstalled\e[0m\n"
