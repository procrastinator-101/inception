#!/bin/bash

# ================= changing ssl keys ownership ================== #
# ================================================================ #

chown 400 /etc/ssl/private/
echo -e "\n\e[32mDone Setting HTTPS\e[0m\n"


# ======================= starting nginx ========================= #
# ================================================================ #

service nginx start
