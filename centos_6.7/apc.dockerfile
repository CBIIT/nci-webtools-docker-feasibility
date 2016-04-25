FROM cbiitss:rbase

RUN yum install -y git && yum clean all

RUN mkdir /deploy

RUN git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /deploy/app 

RUN git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /deploy/tmp

RUN mv /deploy/tmp/common /deploy/app/apc

RUN rm -rf /deploy/tmp


RUN  echo 'from apc import app as application' > /deploy/app/apc/deploy.wsgi


RUN cd /deploy/app/apc && mod_wsgi-express setup-server deploy.wsgi --port 2040 --user apache --group apache --server-root=. --document-root=. --working-directory=.

RUN chown -R apache:apache /deploy

