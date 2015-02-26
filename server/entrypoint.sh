#!/bin/bash

ADMIN_USERNAME=${ADMIN_USERNAME:-admin}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin}
ADMIN_EMAIL=${ADMIN_EMAIL:-"admin@admin.com"}

calamari-ctl initialize --admin-username ${ADMIN_USERNAME} --admin-password ${ADMIN_PASSWORD} --admin-email ${ADMIN_EMAIL}
if [ $? -ne 0 ]; then
    echo "Error in calamari-ctl"
    exit 1
fi

/etc/init.d/supervisor start
/etc/init.d/apache2 start

tail -f /var/log/salt/master &
tail -f /var/log/calamari/calamari.log &
tail -f /var/log/calamari/httpd_error.log

