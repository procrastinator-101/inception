#!/bin/bash

# ==================== configuring wordpress ===================== #
# ================================================================ #

SERVED_PATH=/var/www/html

chown -R www-data:www-data ${SERVED_PATH}/wordpress

find ${SERVED_PATH}/wordpress/ -type d -exec chmod 750 {} \;
find ${SERVED_PATH}/wordpress/ -type f -exec chmod 640 {} \;

chmod 400 ${SERVED_PATH}/wordpress/wp-config.php

echo -e "\n\e[32mDone configuring Wordpress\e[0m\n"


# ===================== starting fpm service ===================== #
# ================================================================ #

php7.3-fpm -F -R
