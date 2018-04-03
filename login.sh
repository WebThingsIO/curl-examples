#!/bin/bash -e

read -p    "Enter    email: " USERNAME
read -s -p "Enter password: " PASSWORD
echo

curl -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -X POST -d '{"email": "'${USERNAME}'", "password": "'${PASSWORD}'"}' \
 --insecure --silent \
 https://gateway.local/login | python -c 'import json,sys; print(json.load(sys.stdin))["jwt"]' > .jwt
