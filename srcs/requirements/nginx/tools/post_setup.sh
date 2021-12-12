#!/bin/bash

cp -p /tools/nginx-selfsigned.{key, crt} /etc/ssl/
echo -e "\n\e[32mSetting HTTPS\t\t\t\t\tdone\e[0m\n"

cp /conf/* /etc/nginx/conf.d
echo -e "\n\e[32mSetting Nginx Configuration\t\t\t\t\tdone\e[0m\n"
