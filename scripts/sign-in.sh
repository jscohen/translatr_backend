curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "jon",
      "password": "2"
    }
  }'
echo
