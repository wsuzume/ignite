#!/bin/bash

if [ -z "${TRUE_INVENTORY}" ]; then
  echo "Error: inventory directory is not defined."
  echo "  please define variable: \$TRUE_INVENTORY"
  exit 1
fi

if [ -d "${TRUE_INVENTORY}" ]; then
    echo "already exists: ${TRUE_INVENTORY}"
    echo "delete or backup before copy"
else
    mkdir -p ${TRUE_INVENTORY}
    mkdir -p ${TRUE_INVENTORY}/root
    mkdir -p ${TRUE_INVENTORY}/user
    mkdir -p ${TRUE_INVENTORY}/mysql
    mkdir -p ${TRUE_INVENTORY}/reverse_proxy
    cp -r ansible/playbook/root/inventory ${TRUE_INVENTORY}/root/inventory
    cp -r ansible/playbook/user/inventory ${TRUE_INVENTORY}/user/inventory
    cp -r mysql/inventory ${TRUE_INVENTORY}/mysql/inventory
    cp -r reverse_proxy/inventory ${TRUE_INVENTORY}/reverse_proxy/inventory
fi
