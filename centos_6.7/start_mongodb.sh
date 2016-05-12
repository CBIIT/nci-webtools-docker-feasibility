#!/bin/bash

docker run -dp 27017 -v /data:/data/ldlink/mongo/data --net host cbiitss:mongodb
