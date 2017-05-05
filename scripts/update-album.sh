curl --include --request PATCH http://localhost:4741/albums/2 \
  --header "Content-Type: application/json" \
  --data '{
    "album": {
      "user_id": "1",
      "name": "Mega Album"
    }
  }'
