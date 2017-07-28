#!/bin/bash

rm -rf /deploy/wsgi

mod_wsgi-express start-server /deploy/app/$APP_NAME.wsgi \
  --port 8000 \
  --document-root /deploy/app \
  --working-directory /deploy/app \
  --directory-index index.html \
  --processes 2 \
  --threads 1 \
  --initial-workers 1 \
  --socket-timeout 900 \
  --queue-timeout 900 \
  --connect-timeout 900 \
  --log-directory /deploy/logs \
  --access-log \
  --access-log-name $APP_NAME-access.log \
  --error-log-name $APP_NAME.log \
  --include-file /etc/httpd/conf.d/additional_configuration.conf &

sleep 1

tail -f /deploy/logs/$APP_NAME.log