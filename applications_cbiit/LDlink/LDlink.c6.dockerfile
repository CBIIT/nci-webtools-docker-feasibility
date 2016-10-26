FROM cbiit/python27:c6

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiit/ldlink" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="Deployment environment for LDlink (based on CentOS 6.8)" \
  VERSION="2.0" \
  UID="LDLINK_2.0_C6"

RUN yum install -y \
    httpd-devel \
    gcc \
    mongodb \
    samtools \
    https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/rpms/tabix-0.2.6-2.1.x86_64.rpm \
 && yum clean all

RUN pip install --upgrade \
    flask \
    mod_wsgi \
    pip \
    pymongo

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy

WORKDIR /deploy

ENTRYPOINT ["mod_wsgi-express"]
CMD ["start-server", "app/LDlink.wsgi", \
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
     "--access-log-name", "LDlink-access.log", \
     "--error-log-name", "LDlink.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
