#!/bin/sh

HTML_PATH=/usr/share/nginx/html/index.html

if [ -z "$HOSTNAME" ]; then
    echo '$HOSTNAME is empty. Set it manually.'
    exit 1
fi

echo "$HOSTNAME" > $HTML_PATH

exec "$@"
