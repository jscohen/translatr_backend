curl --include --request GET http://localhost:4741/albums_by_user \
--header "Content-Type: application/json" \
  --data '{
    "album": {
      "album_id": "2"
    }
  }'

  curl --include --request POST http://localhost:4741/sign-in \
    --header "Content-Type: application/json" \
    --data '{
      "credentials": {
        "email": "jon",
        "password": "2"
      }
    }'
