#!/bin/bash

NAMESPACE=$1

if [ -n $NAMESPACE ]; then
  echo "You may provide a namespace when building these images using the following syntax: "
  echo "    ./build.sh image_namespace"
  echo
  echo "Image building will proceed with the default namespace: cbiitss"
  echo
  $NAMESPACE=cbiitss
fi

echo "This script will create or overwrite the following images: "
for IMAGE_NAME in python_web r_web python_deploy r_deploy; do
  echo "$NAMESPACE:$IMAGE_NAME"
done

read -p "Enter (Y) to continue building these images: " input 

if  [[ "$input" == [Yy] ]]; then
  for IMAGE_NAME in python_web r_web python_deploy r_deploy; do
    docker build -t $NAMESPACE:$IMAGE_NAME -f $IMAGE_NAME.dockerfile .
  done
fi
