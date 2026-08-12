#!/bin/bash
USERNAME="a00046429"
PASSWORD="6QvF0D466ddzf5"
BASE="http://localhost:8000"

TOKEN=$(curl -s -X POST "$BASE/hub/api/authorizations/token" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['token'])")

curl -s -H "Authorization: token $TOKEN" "$BASE/user/$USERNAME/api/kernels" \
  | python3 -c "import sys,json; [print(k['id']) for k in json.load(sys.stdin)]" \
  | while read id; do
      curl -s -X DELETE -H "Authorization: token $TOKEN" "$BASE/user/$USERNAME/api/kernels/$id"
      echo "killed $id"
    done
