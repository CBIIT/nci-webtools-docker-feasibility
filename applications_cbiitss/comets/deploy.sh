#!/bin/bash


## create directories
mkdir -p .tmp app logs

git clone https://github.com/CBIIT/nci-webtools-comets-analytics .tmp/repo
cp .tmp/repo/comets/* ./app/

git clone https://github.com/CBIIT/R-cometsAnalytics .tmp/package
mkdir -p app/restricted/rcode
cp .tmp/package/* ./app/restricted/rcode/

docker-compose up
