#!/bin/bash -e

if [ ! -e .jwt ] || [ ! -e .url ] ; then
  ./login.sh
fi
read JWT < .jwt
read URL < .url

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 ${URL}/things | python -mjson.tool

