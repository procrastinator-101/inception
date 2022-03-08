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


# ====================== confuguring mariadb ===================== #
# ================================================================ #
service mysql start

expect -f /conf/mysql_secure_installation.exp

echo -e "\n\e[32mDone configuring Mariadb\e[0m\n"


# ==================== setup wordpress database ================== #
# ================================================================ #

mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

mysql -e "GRANT ALL ON wordpress.* TO '$WORDPRESS_ADMIN'@'localhost' IDENTIFIED BY '$WORDPRESS_ADMIN_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"
