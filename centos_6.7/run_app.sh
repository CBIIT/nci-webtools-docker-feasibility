#!/bin/bash

#: Description  : Serves a wsgi flask application from a source directory
#: Options      : -r | --root   The root directory of this application - this directory
#                               will be served as the document root and should contain
#                               a deploy.wsgi file containing wsgi-related startup tasks
#               : -p | --port   The port this application will be served on


APP_PORT=
APP_ROOT=
DOCKER_IMAGE=cbiitss
DOCKER_TAG=r_web

while true; do
  case $1 in
    -r | --root ) APP_ROOT=$2; shift 2;;
    -p | --port ) APP_PORT=$2; shift 2;;
    * ) break;;
  esac
done

if [ $APP_ROOT ] && [ $APP_PORT ]; then
  docker run -d -p $APP_PORT:8000 -v $APP_ROOT:/deploy/app $DOCKER_IMAGE:$DOCKER_TAG
else

echo '
Usage   run_app -r /path/to/app -p port

Options
        -r | --root     The root directory of this application - this directory
                        will be served as the document root and should contain
                        a deploy.wsgi file containing wsgi-related startup tasks


        -p | --port     The port this application will be served on
'
fi
