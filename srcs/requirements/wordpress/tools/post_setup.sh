#!/bin/bash

# ==================== configuring wordpress ===================== #
# ================================================================ #

SERVED_PATH=/var/www/html

chown -R www-data:www-data ${SERVED_PATH}

find ${SERVED_PATH} -type d -exec chmod 750 {} \;
find ${SERVED_PATH} -type f -exec chmod 640 {} \;

chmod 644 ${SERVED_PATH}/wp-config.php

echo -e "\n\e[32mDone configuring Wordpress\e[0m\n"


# ============  installing wordpress start page  ============= #
# ============================================================ #

chmod u+x /usr/local/bin/wp

wp core install --allow-root --url=${DOMAIN_NAME} --path=${SERVED_PATH} --title=${HOME_PAGE_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}


# ===============  creating worpdress users  ================= #
# ============================================================ #

wp --allow-root --path=${SERVED_PATH} user create ${WORDPRESS_REGULAR_USER} ${WORDPRESS_REGULAR_USER_EMAIL} --role=author --user_pass=${WORDPRESS_REGULAR_USER_PASSWORD}


# ===================== starting fpm service ===================== #
# ================================================================ #

php-fpm7.3 -F -R
