#!/bin/bash

API="${API_ORIGIN:-https://glosbe.com/gapi/}"
URL_PATH="translate?from=it&dest=eng&format=json&phrase=solitudine&pretty=true"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
