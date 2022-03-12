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

wp core install --allow-root --url=localhost --path=${SERVED_PATH} --title=resume --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=yarroubi@student.1337.ma


# ===============  creating worpdress users  ================= #
# ============================================================ #

wp --allow-root --path=${SERVED_PATH} user create $WORDPRESS_REGULAR_USER $WORDPRESS_REGULAR_USER@gmail.com --role=author --user_pass=$WORDPRESS_REGULAR_USER_PASSWORD


# ===================== starting fpm service ===================== #
# ================================================================ #

php-fpm7.3 -F -R
