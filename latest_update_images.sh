#!/bin/sh

URL=https://registry.hub.docker.com/v2/repositories/library/nginx/tags
LIMIT=100
BEFORE="${1:-1 days ago}"
from_date="$(date -u -d "$BEFORE" '+%Y-%m-%dT%H:%M:%S')"

curl -sSfL "$URL?page_size=$LIMIT" | jq -r --arg from_date "$from_date" '.results | map(select(.last_updated >= $from_date) | select(.name | test("^[0-9]+\\.[0-9]+\\.[0-9]+-alpine$"))) | .[].name' | sort -V
