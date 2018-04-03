#!/bin/bash -e

if [ ! -e .jwt ]; then
  echo "Please create the .jwt file using login.sh"
  exit 1
fi
read JWT < .jwt

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 https://gateway.local/things | python -mjson.tool

