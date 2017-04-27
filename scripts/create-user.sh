curl --include --request POST http://localhost:4741/users \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "email": "jsc",
      "password": "j",
      "password_confirmation": "j"
    }
  }'
