#!/bin/bash

APP_NAME=$1

rm -rf /deploy/wsgi

mod_wsgi-express start-server /deploy/app/$APP_NAME.wsgi \
  --port 8000 \
  --user apache \
  --group apache \
  --document-root /deploy/app \
  --working-directory /deploy/app \
  --directory-index index.html \
  --processes 4 \
  --threads 1 \
  --initial-workers 1 \
  --request-timeout 900 \
  --queue-timeout 900 \
  --connect-timeout 900 \
  --compress-responses \
  --log-directory /deploy/logs \
  --log-to-terminal \
  --access-log \
  --access-log-name $APP_NAME-access.log \
  --include-file /etc/httpd/conf.d/wsgi.conf