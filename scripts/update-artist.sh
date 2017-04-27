curl --include --request PATCH http://localhost:4741/artists/1 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "artist": {
      "user_id": "1"
    }
  }'
