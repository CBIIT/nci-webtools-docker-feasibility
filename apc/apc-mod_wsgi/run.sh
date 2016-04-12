#!/bin/bash

mkdir git deploy wsgi

cd git
git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git
git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git

cp -R nci-analysis-tools-web-presence/* ../deploy/
cp -R nci-webtools-dceg-age-period-cohort/apc ../deploy/
cd ..

echo 'from apc import app as application' > deploy/apc/apc-deploy.wsgi

mod_wsgi-express setup-server deploy/apc/apc-deploy.wsgi --port 9040 --user apache --group apache --server-root=wsgi/apc_test --document-root=deploy --working-directory=deploy/apc

~/wsgi/apc_test/apachectl start