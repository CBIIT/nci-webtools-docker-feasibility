FROM cbiitss:rbase

RUN yum install -y git \
 && yum clean all

RUN pip install --upgrade pysqlcipher 

RUN mkdir /deploy \
 && git clone https://github.com/CBIIT/nci-analysis-tools-glossary.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && mv /tmp/app /deploy/ \
 && mv /tmp/web/common /deploy/app/ \
 && rm -rf /tmp/* \
 && echo 'from glossary import app as application' > /deploy/app/glossary.wsgi

RUN mod_wsgi-express setup-server /deploy/app/glossary.wsgi \
	--port 2080 \
	--user apache \
	--group apache \
	--server-root /deploy \
	--document-root /deploy/app \ 
	--working-directory /deploy/app \
	--directory-index index.html \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
