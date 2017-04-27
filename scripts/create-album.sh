curl --include --request POST http://localhost:4741/albums \
  --header "Content-Type: application/json" \
  --data '{
    "album": {
      "name": "test",
      "artist_id": "1",
      "song_id": "1",
      "user_id": "2"
    }
  }'
