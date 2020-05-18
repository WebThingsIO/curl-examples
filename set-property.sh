#!/bin/bash -e

if [ ! -e .jwt ] || [ ! -e .url ] ; then
  ./login.sh
fi
read JWT < .jwt
read URL < .url

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
 ${URL}/things/${THING}/properties/${PROPERTY} > /dev/null

