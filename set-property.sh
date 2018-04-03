#!/bin/bash -e

if [ ! -e .jwt ]; then
  echo "Please create the .jwt file using login.sh"
  exit 1
fi
read JWT < .jwt

THING="$1"
PROPERTY="$2"
VALUE="$3"

if [ -z "${VALUE}" ]; then
  echo "Usage: set-property.sh THING PROPERTY VALUE"
  exit 1
fi

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -X PUT -d '{"'${PROPERTY}'":'${VALUE}'}' \
 --insecure --silent \
 https://gateway.local/things/${THING}/properties/${PROPERTY} > /dev/null

