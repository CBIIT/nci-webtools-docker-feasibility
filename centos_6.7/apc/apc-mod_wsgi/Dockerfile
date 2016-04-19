FROM centos:6.7

RUN yum -y install epel-release && yum clean all
RUN yum -y upgrade && yum clean all

RUN yum -y install \
	httpd \
	httpd-devel && yum clean all

RUN yum -y install \
	python \
	python-devel \
	python-pip && yum clean all

RUN yum -y install \
	java-1.7.0-openjdk-* && yum clean all

RUN yum -y install \
	R && yum clean all

RUN yum -y install \
	git \
	readline-devel && yum clean all


RUN pip install --upgrade pip

RUN pip install argparse
RUN pip install flask
RUN pip install rpy2
RUN pip install mod_wsgi

RUN R CMD javareconf -e
RUN R -e "install.packages(c('jsonlite', 'xlsx'), repos='http://cran.rstudio.com')"
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

EXPOSE 80

COPY run.sh /run.sh
RUN chmod -v +x /run.sh

ENTRYPOINT ["/run.sh"]
