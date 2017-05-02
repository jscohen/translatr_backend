curl --include --request POST http://localhost:4741/lyrics \
  --header "Content-Type: application/json" \
  --data '{
    "lyrics": {
      "song_id": "7",
      "title": "Viveme",
      "artist": "Laura Pausini"
    }
  }'
