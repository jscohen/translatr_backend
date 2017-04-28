curl --include --request POST http://localhost:4741/songs \
  --header "Content-Type: application/json" \
  --data '{
    "song": {
      "name": "test",
      "album": "tests",
      "artist_id": "1"
    }
  }'
