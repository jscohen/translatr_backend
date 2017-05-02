curl --include --request POST http://localhost:4741/songs \
  --header "Content-Type: application/json" \
  --data '{
    "song": {
      "name": "Ragazze Che",
      "album": "Laura Pausini",
      "artist_id": "2",
      "user_id": "1"
    }
  }'
