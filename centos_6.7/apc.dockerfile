FROM cbiitss:rbase

ENV name apc
ENV port 2040
ENV root /deploy
ENV conf additional-configuration.conf

RUN yum install -y git \
 && yum clean all

RUN mkdir -p $root/app $root/wsgi $root/logs \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && cp -R /tmp/app/apc/* $root/app \
 && cp -R /tmp/web/common $root/app/common \
 && rm -rf /tmp/* \
 && echo 'from apc import app as application' > $root/app/$name.wsgi
 
COPY $conf $root/wsgi/$conf

RUN mod_wsgi-express setup-server $root/app/$name.wsgi \
	--port $port \
	--user apache \
	--group apache \
	--server-root $root/wsgi \
	--document-root $root/app \ 
	--working-directory $root/app \
	--directory-index index.html \
	--log-directory $root/logs \
	--rotate-logs \
	--error-log-name $name.log \
	--include-file $root/wsgi/$conf \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/wsgi/apachectl", "start", "-DFOREGROUND"]
