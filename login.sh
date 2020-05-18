#!/bin/bash -e

source ./common.sh

URL=$(get_url)
EMAIL=$(get_email)
PASSWORD=$(get_password)

echo

JSON=$(curl -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -X POST -d "{\"email\": \"${EMAIL}\", \"password\": \"${PASSWORD}\"}" \
    --insecure --silent \
    "${URL}"/login)

get_value > .jwt

echo "${URL}" > .url
