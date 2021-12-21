#!/bin/bash

service mysql start

expect -f /conf/mysql_secure_installation.exp

echo -e "\n\e[32mmariadb\t\t\t\t\tconfiguration done\e[0m\n"

bash
