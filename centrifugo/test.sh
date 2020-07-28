#!/bin/bash

curl --header "Content-Type: application/json" \
  --header "Authorization: apikey 75f1b8bc-38e9-456e-91a1-a6a79c8997d6" \
  --request POST \
  --data '{"method": "publish", "params": {"channel": "channel", "data": {"msg": "From Command Line channel"}}}' \
  http://localhost:8000/api
