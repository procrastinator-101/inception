#!/bin/bash

apt-get update

# ====================== installing Mariadb ====================== #
# ================================================================ #

apt-get -y install mariadb-server
echo -e "\n\e[32mmariadb\t\t\t\t\tinstalled\e[0m\n"


# ======== installing expect for mariadb configuration =========== #
# ================================================================ #

apt-get -y install expect
echo -e "\n\e[32mexpect\t\t\t\t\tinstalled\e[0m\n"


# ===================== configuring Mariadb ====================== #
# ================================================================ #

cp -f /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
echo -e "\n\e[32mMariadb\t\t\t\t\tconfigured\e[0m\n"
