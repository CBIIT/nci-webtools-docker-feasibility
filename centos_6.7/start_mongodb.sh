#!/bin/bash

docker network create -d bridge analysistools-net
docker run -dp 27017 -v /data:/data/ldlink/mongo/data --net=analysistools-net cbiitss:mongodb
