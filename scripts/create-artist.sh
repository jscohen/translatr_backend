curl --include --request POST http://localhost:4741/artists \
  --header "Content-Type: application/json" \
  --data '{
    "artist": {
      "name": "Sarit Hadad",
      "genre": "Pop"
    }
  }'
