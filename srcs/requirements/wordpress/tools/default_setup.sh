#!/bin/bash

apt-get update

# ======================== installing curl ======================= #
# ================================================================ #

apt-get -y install curl
echo -e "\n\e[32mcurl\t\t\t\t\tinstalled\e[0m\n"


# ========= installing necessary utilities to intsall php ======== #
# ================================================================ #

apt-get install -y wget gnupg2 ca-certificates lsb-release apt-transport-https


# ===================== installing php7.3 ======================== #
# ================================================================ #

wget https://packages.sury.org/php/apt.gpg
apt-key add apt.gpg

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list

apt-get update

apt-get install -y php7.3 php7.3-cli php7.3-common


# ================== setting php7.3 as default =================== #
# ================================================================ #

update-alternatives --set php /usr/bin/php7.3


# ================ setting php support for Nginx ================= #
# ================================================================ #

apt-get install -y php7.3-fpm


# ================ setting php support for Mysql ================= #
# ================================================================ #

apt-get install -y php7.3-mysql


# ============== setting php support for Wordpress =============== #
# ================================================================ #

apt-get install -y php7.3-mysql php7.3-dom php7.3-simplexml php7.3-ssh2 php7.3-xml php7.3-xmlreader php7.3-curl  php7.3-exif  php7.3-ftp php7.3-gd  php7.3-iconv php7.3-imagick php7.3-json  php7.3-mbstring php7.3-posix php7.3-sockets php7.3-tokenizer


echo -e "\n\e[32mphp\t\t\t\t\tinstalled\e[0m\n"


# ========================== cleaning ============================ #
# ================================================================ #

rm apt.gpg
