#!/bin/bash -e

if [ ! -e .jwt ] || [ ! -e .url ] ; then
  ./login.sh
fi
read JWT < .jwt
read URL < .url

THING="$1"
PROPERTY="$2"

if [ -z "${PROPERTY}" ]; then
  echo "Usage: get-property.sh THING PROPERTY"
  exit 1
fi

curl -H "Authorization:Bearer ${JWT}" \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 --insecure --silent \
 ${URL}/things/${THING}/properties/${PROPERTY} | python -mjson.tool
