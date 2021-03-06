FROM cbiitss/python27:c6

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiitss/econsent" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="Deployment environment for eConsent tool (based on CentOS 6.8)" \
  VERSION="1.0" \
  UID="ECONSENT_1.0_C6"

RUN yum -y upgrade \
 && yum -y install \
    gcc \
    httpd-devel \
    libffi-devel \
 && yum clean all

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    weasyprint

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/econsent.wsgi", \
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
     "--access-log-name", "econsent-access.log", \
     "--error-log-name", "econsent.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
