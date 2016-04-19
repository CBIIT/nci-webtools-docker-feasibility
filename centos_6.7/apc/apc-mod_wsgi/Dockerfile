FROM centos:6.7

RUN yum -y install epel-release && yum clean all
RUN yum -y upgrade && yum clean all

RUN yum -y install \
	httpd \
	httpd-devel \
	&& yum clean all

RUN yum -y install \
	python \
	python-devel \
	python-pip \
	&& yum clean all

RUN yum -y install \
	R \
	&& yum clean all

RUN yum -y install \
	java-1.7.0-openjdk-* \
	&& yum clean all

RUN yum -y install \
	git \
	tar \
	readline-devel \
	&& yum clean all

RUN R CMD javareconf -e
RUN R -e "install.packages(c('jsonlite', 'xlsx', 'R.utils'), repos='http://cran.rstudio.com')"
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN pip install --upgrade pip

RUN pip install argparse
RUN pip install flask
RUN pip install mod_wsgi


COPY rpy2-2.5.6.tar.gz /rpy2-2.5.6.tar.gz
RUN tar -xf /rpy2-2.5.6.tar.gz && cd /rpy2-2.5.6 && python setup.py install

EXPOSE 80

#COPY run.sh /run.sh
#RUN chmod -v +x /run.sh



RUN mkdir /deploy

RUN git clone https://github.com/CBIIT/nci-webtools-dceg-age-period-cohort.git /deploy/tmp
RUN git clone https://github.com/CBIIT/nci-analysis-tools-web-presence.git /deploy/app

RUN mv /deploy/tmp/apc /deploy/app/
RUN rm -rf /deploy/tmp

RUN echo 'from apc import app as application' > /deploy/app/apc/apc-deploy.wsgi

RUN mod_wsgi-express setup-server /deploy/app/apc/apc-deploy.wsgi --port 9040 --user apache --group apache --server-root=/deploy --document-root=/deploy/app --working-directory=/deploy/app/apc

RUN chown -R apache:apache /deploy
#/deploy/apachectl start -DFOREGROUND 


#ENTRYPOINT ["/deploy/apachectl", "start", "-DFOREGROUND"]
ENTRYPOINT ["/bin/bash"]
