#!/bin/bash

API="${API_ORIGIN:-http://api.musixmatch.com/ws/1.1/}"
URL_PATH="track.search?apikey=ddaaba14dee2f996db5626c25b66564b&q_artist=laura%20pausini&q_track=la%20solitudine&f_has_lyrics=1&page_size=1"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
