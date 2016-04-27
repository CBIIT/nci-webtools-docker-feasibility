FROM cbiitss:rbase

RUN yum install -y git \
 && yum clean all

RUN pip install numpy pandas scipy
RUN R -e "install.packages(c('RJSONIO', 'stringr'), repos='http://cran.rstudio.com')"

RUN mkdir /deploy \
 && git clone https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools.git /tmp/app \
 && git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /tmp/web \
 && mv /tmp/app/biomarkerTools /deploy/app/ \
 && mv /tmp/web/common /deploy/app/ \
 && rm -rf /tmp/* \
 && echo 'from biomarkerTools import app as application' > /deploy/app/biomarkerTools.wsgi

RUN mod_wsgi-express setup-server /deploy/app/biomarkerTools.wsgi \
	--port 2160 \
	--user apache \
	--group apache \
	--server-root /deploy \
	--document-root /deploy/app \ 
	--working-directory /deploy/app \
	--directory-index index.html \
 && chown -R apache:apache /deploy

ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
