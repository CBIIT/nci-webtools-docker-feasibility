FROM cbiitss/python27:c7

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiitss/cancerterms" \
  DEFAULT_TAG="centos7" \
  DESCRIPTION="Deployment environment for Cancer Terms API (based on CentOS 7)" \
  VERSION="1.0" \
  UID="CANCERTERMS_1.0_C7"

RUN yum -y upgrade \
 && yum -y install \
    gcc \
    httpd-devel \
    openssl-devel \
 && yum clean all

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    pysqlcipher

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/CancerTerms.wsgi", \
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
     "--access-log-name", "CancerTerms-access.log", \
     "--error-log-name", "CancerTerms.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
