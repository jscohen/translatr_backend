#!/bin/bash

API="${API_ORIGIN:-https://glosbe.com/gapi/}"
URL_PATH="translate?from=fra&dest=eng&format=json&phrase=chat&pretty=true&tm=false"
curl "${API}${URL_PATH}" \
  --include \
  --request GET

echo
