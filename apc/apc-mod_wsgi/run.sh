#!/bin/bash

mkdir -p /test /test/git /test/deploy /test/wsgi

cd /test/git
git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git
git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git

cp -R nci-analysis-tools-web-presence/* /test/deploy/
cp -R nci-webtools-dceg-age-period-cohort/apc /test/deploy/

echo 'from apc import app as application' > /test/deploy/apc/apc-deploy.wsgi

mod_wsgi-express setup-server /test/deploy/apc/apc-deploy.wsgi --port 9040 --user apache --group apache --server-root=/test/wsgi/apc_test --document-root=/test/deploy --working-directory=/test/deploy/apc

chmod -R 777 /test
chown -R apache:apache /test
/test/wsgi/apc_test/apachectl start -DFOREGROUND 
