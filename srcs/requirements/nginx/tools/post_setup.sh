#!/bin/bash


cp -p /tools/nginx-selfsigned.key /etc/ssl/private/
cp -p /tools/nginx-selfsigned.crt /etc/ssl/certs/
echo -e "\n\e[32mSetting HTTPS\t\t\t\t\tdone\e[0m\n"


cp /conf/nginx.conf /etc/nginx/
cp /conf/default.conf /etc/nginx/conf.d/
echo -e "\n\e[32mSetting Nginx Configuration\t\t\t\t\tdone\e[0m\n"

rm -rf /etc/nginx/sites-enabled/*
rm -rf /etc/nginx/sites-available/*

rm -rf /tools /conf

service nginx start