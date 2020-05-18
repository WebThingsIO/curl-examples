#!/bin/bash -e
source ./common.sh
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

PROPERTIES_URL=${URL}/things/${THING}/properties

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 ${PROPERTIES_URL} | python -mjson.tool
