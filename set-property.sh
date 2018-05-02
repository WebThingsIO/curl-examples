#!/bin/sh

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

if [ ! -e .url ]; then
  echo "Please create the .url file using login.sh"
  exit 1
fi
read URL < .url

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -X PUT -d '{"'${PROPERTY}'":'${VALUE}'}' \
 --insecure --silent \
 ${URL}/things/${THING}/properties/${PROPERTY} > /dev/null

