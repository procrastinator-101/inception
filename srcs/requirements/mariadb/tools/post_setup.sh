#!/bin/bash

# ====================== confuguring mariadb ===================== #
# ================================================================ #

service mysql start

expect -f /conf/mysql_secure_installation.exp

echo -e "\n\e[32mDone configuring Mariadb\e[0m\n"


# ================== set mysql root password ===================== #
# ================================================================ #

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"


# ==================== setup wordpress database ================== #
# ================================================================ #

if [ ! -d "/var/lib/mysql/$WORDPRESS_DB" ]; then

    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $WORDPRESS_DB.* TO '$WORDPRESS_ADMIN' IDENTIFIED BY '$WORDPRESS_ADMIN_PASSWORD';"

    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

    mysql -uroot -p$MYSQL_ROOT_PASSWORD $WORDPRESS_DB < /conf/wpStart.sql

fi


mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown


# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /tools

rm -rf /conf


# ============ starting mysql service in the foreground ========== #
# ================================================================ #

mysqld_safe
