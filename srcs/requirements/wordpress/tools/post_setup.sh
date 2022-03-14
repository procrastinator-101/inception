#!/bin/bash

# ============  installing wordpress start page  ============= #
# ============================================================ #

wp core install --allow-root --url=${DOMAIN_NAME} --path=${WORDPRESS_SERVED_FILES_PATH} --title=${HOME_PAGE_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}


# ===============  creating worpdress users  ================= #
# ============================================================ #

wp --allow-root --path=${WORDPRESS_SERVED_FILES_PATH} user create ${WORDPRESS_REGULAR_USER} ${WORDPRESS_REGULAR_USER_EMAIL} --role=author --user_pass=${WORDPRESS_REGULAR_USER_PASSWORD}


# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /tools


# ===================== starting fpm service ===================== #
# ================================================================ #

php-fpm7.3 -F -R
