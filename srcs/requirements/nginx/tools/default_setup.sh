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
