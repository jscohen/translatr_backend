curl --include --request DELETE http://localhost:4741/songs/47 \
--header "Content-Type: application/json" \
--data '{
  "song": {
    "user_id": "3"
  }
}'