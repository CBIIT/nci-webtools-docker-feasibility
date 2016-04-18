FROM centos:6.7

RUN yum -y install epel-release

RUN yum -y upgrade && yum -y install \
    httpd \
    httpd-devel \
    python \
    python-devel \
    python-pip \
    readline-devel \
    java-1.7.0-openjdk-* \
    git \
    R && yum clean all 

RUN pip install --upgrade pip && pip install flask rpy2 mod_wsgi
RUN R CMD javareconf -e
RUN R -e "install.packages(c('jsonlite', 'xlsx'), repos='http://cran.rstudio.com')"
RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

EXPOSE 80

COPY run.sh /run.sh
RUN chmod -v +x /run.sh

ENTRYPOINT ["/run.sh"]
