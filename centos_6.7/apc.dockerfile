FROM cbiitss:rbase

RUN yum install -y git \
 && yum clean all

RUN mkdir -p /deploy/app /deploy/wsgi /deploy/logs \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && mv /tmp/app/apc /deploy/app/ \
 && mv /tmp/web/common /deploy/app/ \
 && rm -rf /tmp/* \
 && echo 'from apc import app as application' > /deploy/app/apc.wsgi
 
COPY additional-configuration.conf /deploy/wsgi/additional-configuration.conf

RUN mod_wsgi-express setup-server /deploy/app/apc.wsgi \
	--port 2040 \
	--user apache \
	--group apache \
	--server-root /deploy/wsgi \
	--document-root /deploy/app \ 
	--working-directory /deploy/app \
	--directory-index index.html \
	--log-directory /deploy/logs \
	--rotate-logs \
	--error-log-name apc.log \
	--include-file /deploy/wsgi/additional-configuration.conf \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
