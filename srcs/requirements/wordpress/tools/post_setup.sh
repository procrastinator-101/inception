#!/bin/bash

# ===================== installing wordpress ===================== #
# ================================================================ #

# curl https://wordpress.org/wordpress-5.8.2.tar.gz > /tmp/wordpress-5.8.2.tar.gz

SERVED_PATH=/var/www/html

mkdir -p ${SERVED_PATH}

tar xzvf /tools/wordpress-5.8.2.tar.gz -C ${SERVED_PATH}

cp /conf/wp-config.php ${SERVED_PATH}/wordpress/wp-config.php

mkdir ${SERVED_PATH}/wordpress/wp-content/upgrade

echo -e "\n\e[32mwordpress\t\t\t\t\tinstalled\e[0m\n"


# ==================== configuring wordpress ===================== #
# ================================================================ #

chown -R www-data:www-data ${SERVED_PATH}/wordpress

find ${SERVED_PATH}/wordpress/ -type d -exec chmod 750 {} \;
find ${SERVED_PATH}/wordpress/ -type f -exec chmod 640 {} \;

chmod 400 ${SERVED_PATH}/wordpress/wp-config.php

echo -e "\n\e[32mDone configuring Wordpress\e[0m\n"


# ========================== hanging ============================= #
# ================================================================ #

service php7.3-fpm start

sleep 1500
