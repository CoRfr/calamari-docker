#!/bin/bash

LOG_LEVEL=${LOG_LEVEL:-debug}

if [ -z "$MASTER_IP" ]; then
    echo "MASTER_IP not provided"
    exit 1
fi

echo "master: $MASTER_IP" > /etc/salt/minion.d/calamari.conf

salt-minion -l ${LOG_LEVEL} &
SALT_PID=$!

while ! ls /etc/diamond/diamond.conf > /dev/null 2&>1; do
    sleep 1
done

diamond -f -l

