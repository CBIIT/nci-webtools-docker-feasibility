#!/bin/bash

exec python /var/www/html/demo.py &
rm -rf /run/httpd/* /tmp/httpd* &
exec apachectl -DFOREGROUND