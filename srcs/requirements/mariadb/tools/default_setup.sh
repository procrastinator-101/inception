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


# ======== installing expect for mariadb configuration =========== #
# ================================================================ #

apt-get -y install vim
echo -e "\n\e[32mexpect\t\t\t\t\tinstalled\e[0m\n"
