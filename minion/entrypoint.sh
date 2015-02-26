#!/bin/bash

if [ -z "$MASTER_IP" ]; then
    echo "MASTER_IP not provided"
    exit 1
fi

echo "master: $MASTER_IP" > /etc/salt/minion.d/calamari.conf

salt-minion -l info

