#! /bin/bash
function get_value {
    python -c "import json,sys; print(${JSON}['jwt'])"
}

function get_url {
    if [ -z "${URL}" ]; then
        read -p    "Enter      URL: " URL
    fi
    echo "${URL}"
}

function get_email {
    if [ -z "${EMAIL}" ]; then
        read -p    "Enter    email: " EMAIL
    fi
    echo "${EMAIL}"
}

function get_password {
    if [ -z "${PASSWORD}" ]; then
        read -s -p "Enter password: " PASSWORD
    fi
    echo "${PASSWORD}"
}
