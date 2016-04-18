#!/bin/bash

mkdir /deploy

git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /deploy/tmp
git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /deploy/app

mv /deploy/tmp/apc /deploy/app/
rm -rf /deploy/tmp

echo 'from apc import app as application' > /deploy/app/apc/apc-deploy.wsgi

mod_wsgi-express setup-server /deploy/app/apc/apc-deploy.wsgi --port 9040 --user apache --group apache --server-root=/deploy --document-root=/deploy/app --working-directory=/deploy/app/apc

chown -R apache:apache /deploy
/deploy/apachectl start -DFOREGROUND 
