curl --include --request DELETE http://localhost:4741/artists/2 \
--header "Content-Type: application/json" \
--data '{
  "artist": {
    "user_id": "1"
  }
}'
