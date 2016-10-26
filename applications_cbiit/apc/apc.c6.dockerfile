FROM cbiit/r_base:c6

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiit/apc" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="Deployment environment for Age Period Cohort Tool (based on CentOS 6.8)" \
  VERSION="1.1" \
  UID="APC_1.1_C6"

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    httpd-devel \
    readline-devel \
 && yum clean all

RUN pip install --upgrade \
    flask \
    mod_wsgi \
    pip \
    rpy2 \
 && R -e "install.packages(c( \
    'jsonlite', \
    'xlsx'))"

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/apc.wsgi", \
     "--port", "8000", \
     "--document-root", "app", \
     "--working-directory", "app", \
     "--directory-index", "index.html", \
     "--processes", "2", \
     "--threads", "1", \
     "--initial-workers", "1", \
     "--socket-timeout", "300", \
     "--queue-timeout", "300", \
     "--shutdown-timeout", "300", \
     "--graceful-timeout", "300", \
     "--connect-timeout", "300", \
     "--log-directory", "logs", \
     "--rotate-logs", \
     "--access-log", \
     "--access-log-name", "apc-access.log", \
     "--error-log-name", "apc.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
