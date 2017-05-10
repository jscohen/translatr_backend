curl --include --request PATCH http://localhost:4741/songs/47 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "song": {
      "name": "Inta Daiman",
      "album": "20",
      "artist": "BOO",
      "user_id": "3"
    }
  }'
