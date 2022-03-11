#!/bin/bash

# ====================== confuguring mariadb ===================== #
# ================================================================ #

service mysql start

# expect -f /conf/mysql_secure_installation.exp

echo -e "\n\e[32mDone configuring Mariadb\e[0m\n"


# ==================== setup wordpress database ================== #
# ================================================================ #

# mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

mysql -e "GRANT ALL ON wordpress.* TO 'wordpress_owner' IDENTIFIED BY 'OwnerPassword';"

mysql -e "FLUSH PRIVILEGES;"


# ============ starting mysql service in the foreground ========== #
# ================================================================ #


sleep 5000
