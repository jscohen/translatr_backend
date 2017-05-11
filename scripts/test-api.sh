#!/bin/bash

API="${API_ORIGIN:-http://api.musixmatch.com/ws/1.1/}"
URL_PATH="track.search?apikey=ddaaba14dee2f996db5626c25b66564b&q_artist=michael%20jackson&q_track=thriller&format=json&page_size=1&has_lyrics=1"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
