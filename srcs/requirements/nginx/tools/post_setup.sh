#!/bin/bash

# ================= changing ssl keys ownership ================== #
# ================================================================ #

chmod -R 400 /etc/ssl/private/
echo -e "\n\e[32mDone changing ssl Keys ownership\e[0m\n"


# ======================= starting nginx ========================= #
# ================================================================ #

service nginx start
