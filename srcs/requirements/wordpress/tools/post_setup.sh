#!/bin/bash

# ===================== installing wordpress ===================== #
# ================================================================ #

# curl https://wordpress.org/wordpress-5.8.2.tar.gz > /tmp/wordpress-5.8.2.tar.gz

mkdir -p /var/www/

tar xzvf /tools/wordpress-5.8.2.tar.gz -C /var/www/

cp /conf/wp-config.php /var/www/wordpress/wp-config.php

mkdir /var/www/wordpress/wp-content/upgrade

echo -e "\n\e[32mwordpress\t\t\t\t\tinstalled\e[0m\n"


# ==================== configuring wordpress ===================== #
# ================================================================ #

chown -R www-data:www-data /var/www/wordpress

find /var/www/wordpress/ -type d -exec chmod 750 {} \;
find /var/www/wordpress/ -type f -exec chmod 640 {} \;

chmod 400 /var/www/wordpress/wp-config.php

echo -e "\n\e[32mwordpress configuration\t\t\t\t\tdone\e[0m\n"


# ========================== cleaning ============================ #
# ================================================================ #

rm -rf /tools /conf

bash
