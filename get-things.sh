#!/bin/bash -e

if [ ! -e .jwt ]; then
  echo "Please create the .jwt file using login.sh"
  exit 1
fi
read JWT < .jwt

if [ ! -e .url ]; then
  echo "Please create the .url file using login.sh"
  exit 1
fi
read URL < .url

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 ${URL}/things | python -mjson.tool

