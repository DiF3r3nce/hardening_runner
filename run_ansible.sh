#!/bin/bash

# Script to run Ansible playbook with an external variables file.

# Check if a path to the variables file is provided
if [ "$#" -ne 1 ]; then
    echo "Please provide a path! Usage: $0 /path/to/your/extra_vars.yml"
    exit 1
fi

# The path to the variables file from command line argument
VARS_FILE="$1"

# Check if the specified variables file exists
if [ ! -f "$VARS_FILE" ]; then
    echo "Error: Variables file does not exist at specified path: $VARS_FILE"
    exit 1
fi

# Path to the inventory file and playbook
INVENTORY_PATH="inventory.ini"
PLAYBOOK_PATH="playbook.yml"

# Running the Ansible playbook with the specified variables file
ansible-playbook -i "$INVENTORY_PATH" "$PLAYBOOK_PATH" -e "@$VARS_FILE"
