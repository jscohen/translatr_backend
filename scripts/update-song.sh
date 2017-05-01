curl --include --request PATCH http://localhost:4741/songs/5 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "song": {
      "name": "Inta Daiman",
      "album": "20",
      "artist_id": "1",
      "user_id": "1"
    }
  }'
