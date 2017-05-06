curl --include --request PATCH http://localhost:4741/artists/1 \
  --header "Content-Type: application/json" \
  --data '{
    "artist": {
      "user_id": "1",
      "name": "Me",
      "genre": "BOO"
    }
  }'
