FROM cbiitss/r_base:c6

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiitss/jpsurv" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="Deployment environment for JPSurv (based on CentOS 6.8)" \
  VERSION="1.0" \
  UID="JPSURV_1.0_C6"

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
 && R -e "install.packages('rjson')" \
 && R -e "install.packages('https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiitss/packages/JPSurv_2.0.19.tar.gz', repos = NULL)"

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/jpsurv.wsgi", \
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
     "--access-log-name", "jpsurv-access.log", \
     "--error-log-name", "jpsurv.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
