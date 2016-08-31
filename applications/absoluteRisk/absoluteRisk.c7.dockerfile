FROM cbiitss/r_base:c7

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiitss/absoluterisk" \
  DEFAULT_TAG="centos7" \
  DESCRIPTION="Deployment environment for Absolute Risk Calculator (based on CentOS 7)" \
  VERSION="1.0" \
  UID="ABSOLUTERISK_1.0_C7"

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
 && R -e "install.packages('https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiitss/packages/iCARE_1.1.0.tar.gz', repos = NULL)"

RUN ln -s /usr/lib/jvm/jre/lib/amd64/server/libjvm.so /usr/lib64/libjvm.so

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/absoluteRisk.wsgi", \
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
     "--access-log-name", "absoluteRisk-access.log", \
     "--error-log-name", "absoluteRisk.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
