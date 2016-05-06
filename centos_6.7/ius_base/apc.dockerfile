FROM cbiitss:rbase_ius

RUN yum install -y git \
 && yum clean all

RUN mkdir /deploy \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && mv /tmp/app/apc /deploy/ \
 && mv /tmp/web/common /deploy/apc/ \
 && rm -rf /tmp/* \
 && echo 'from apc import app as application' > /deploy/apc/deploy.wsgi

RUN mod_wsgi-express setup-server /deploy/app/apc/deploy.wsgi \
	--port 2040 \
	--user apache \
	--group apache \
	--server-root /deploy \
	--document-root /deploy/apc \ 
	--working-directory /deploy/apc \
	--directory-index index.html \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
