#!/bin/bash

API="${API_ORIGIN:-https://translate.yandex.net/api/v1.5/tr.json/}"
URL_PATH="translate?lang=it-en&key=trnsl.1.1.20170502T140240Z.e335e8f283001e99.9b5c9ad87ddb4e729013b79f9009d8a6b993602f&text=che%20cosa"
curl "${API}${URL_PATH}" \
  --include \
  --request GET
