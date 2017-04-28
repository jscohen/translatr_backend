curl --include --request POST http://localhost:4741/songs \
  --header "Content-Type: application/json" \
  --data '{
    "song": {
      "name": "La Solitudine",
      "album": "Laura Pausini"
    }
  }'
