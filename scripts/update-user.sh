curl --include --request PATCH http://localhost:4741/users/1 \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "user": {
      "album_id": "1"
    }
  }'
