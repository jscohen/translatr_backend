curl --include --request PATCH http://localhost:4741/artists/47 \
  --header "Content-Type: application/json" \
  --data '{
    "artist": {
      "user_id": "3",
      "name": "Me",
      "artist": "Queen",
      "genre": "BOO"
    }
  }'
