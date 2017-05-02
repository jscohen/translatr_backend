curl --include --request POST http://localhost:4741/lyrics \
  --header "Content-Type: application/json" \
  --data '{
    "lyrics": {
      "song_id": "19",
      "title": "Ragazze Che",
      "artist": "Laura Pausini"
    }
  }'
