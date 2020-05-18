#!/bin/bash -e
if [ ! -e .jwt ] || [ ! -e .url ] ; then
  ./login.sh
fi
read JWT < .jwt
read URL < .url

THING="$1"

if [ -z "${THING}" ]; then
  echo "Usage: get-properties.sh THING"
  exit 1
fi


curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 ${URL}/things/${THING}/properties | python -mjson.tool
