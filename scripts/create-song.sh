curl --include --request POST http://localhost:4741/songs \
  --header "Content-Type: application/json" \
  --data '{
    "song": {
      "name": "TEST",
      "artist": "TEST",
      "album": "TEST",
      "user_id": "3"
    }
  }'
