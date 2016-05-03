FROM cbiitss:rbase

RUN yum install -y git mongodb samtools \
 && yum clean all

COPY dependencies/tabix-0.2.6-2.1.x86_64.rpm .
RUN yum localinstall -y tabix-0.2.6-2.1.x86_64.rpm

RUN pip install numpy pandas scipy bokeh

RUN mongod --dbpath /data/db/ --auth --port 27017

RUN mkdir /deploy \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-linkage.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && mv /tmp/app/LDlink /deploy/app/ \
 && mv /tmp/web/common /deploy/app/ \
 && rm -rf /tmp/* \
 && echo 'from LDlink import app as application' > /deploy/app/LDlink.wsgi

RUN mod_wsgi-express setup-server /deploy/app/LDlink.wsgi \
	--port 2090 \
	--user apache \
	--group apache \
	--server-root /deploy \
	--document-root /deploy/app \ 
	--working-directory /deploy/app \
	--directory-index index.html \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
