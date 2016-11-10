#!/bin/bash

NAMESPACE=$1
VERSION="v0"

if [[ -z $NAMESPACE ]]; then
  NAMESPACE=cbiit

  echo "You may provide a namespace when running this script: "
  echo "    sh build.sh image_namespace"
  echo
  echo "Using default namespace: $NAMESPACE"
  echo
fi

echo "The following images will be (re)built: "
for IMAGE_NAME in python_web r_web python_deploy r_deploy; do
  echo "$NAMESPACE:$IMAGE_NAME"
done

read -p "Enter (Y) to continue building these images: " input 

if  [[ "$input" == [Yy] ]]; then
  for IMAGE_NAME in python_web r_web python_deploy r_deploy; do
    docker build -f $IMAGE_NAME.dockerfile -t $NAMESPACE/$IMAGE_NAME:$VERSION .
  done
fi
