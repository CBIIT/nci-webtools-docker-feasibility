FROM cbiit/r_base:c7

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiit/pathway" \
  DEFAULT_TAG="centos7" \
  DESCRIPTION="Deployment environment for Pathway analysis tool (based on CentOS 7)" \
  VERSION="1.0" \
  UID="PATHWAY_1.0_C7"

RUN yum -y upgrade \
 && yum -y install \
    gcc \
    httpd-devel \
    readline-devel \
 && yum clean all

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    rpy2 \
    stompest \
    stompest.async \
    twisted

RUN R -e "install.packages('rjson')" \
 && R -e "install.packages('https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/ARTP3_0.8.34.tar.gz', repos = NULL)"

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/pathway.wsgi", \
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
     "--access-log-name", "pathway-access.log", \
     "--error-log-name", "pathway.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
