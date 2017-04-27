curl --include --request PATCH http://localhost:4741/albums/1 \
  --header "Content-Type: application/json" \
  --data '{
    "album": {
      "name": "20",
      "user_id": "1",
      "song_id": "1",
      "artist_id": "1"
    }
  }'
