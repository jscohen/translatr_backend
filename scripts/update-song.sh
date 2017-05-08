curl --include --request PATCH http://localhost:4741/songs/25 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "song": {
      "name": "Inta Daimanman",
      "album": "19",
      "artist_id": "50",
      "user_id": "1"
    }
  }'
