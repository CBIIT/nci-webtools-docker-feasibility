FROM cbiitss:rbase_ius

RUN yum install -y git \
 && yum clean all

RUN mkdir /deploy \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /deploy/tmp \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /deploy/app \
 && mv /deploy/tmp/* /deploy/app/ \
 && rm -rf /deploy/tmp \
 && echo 'from apc import app as application' > /deploy/app/apc/deploy.wsgi

RUN mod_wsgi-express setup-server /deploy/app/apc/deploy.wsgi \
	--port 2040 \
	--user apache \
	--group apache \
	--server-root /deploy \
	--document-root /deploy/app \ 
	--working-directory /deploy/app/apc \
	--directory-index index.html \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
