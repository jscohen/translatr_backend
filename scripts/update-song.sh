curl --include --request PATCH http://localhost:4741/songs/37 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "song": {
      "name": "Inta Daiman",
      "album": "20",
      "user_id": "3"
    }
  }'
