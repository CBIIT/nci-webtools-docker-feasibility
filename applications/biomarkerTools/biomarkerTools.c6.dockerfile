FROM cbiitss/r_base:c6

LABEL \
  BASE_OS="CentOS 6.8" \
  DEFAULT_IMAGE="cbiitss/biomarkertools" \
  DEFAULT_TAG="centos6" \
  DESCRIPTION="Deployment environment for Biomarker Tools Suite (based on CentOS 6.8)" \
  VERSION="1.0" \
  UID="BIOMARKERTOOLS_1.0_C6"

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    httpd-devel \
    readline-devel \
 && yum clean all

RUN pip install --upgrade \
    flask \
    mod_wsgi \
    numpy \
    pandas \
    pip \
    rpy2

RUN R -e "install.packages(c( \
    'pROC', \
    'RJSONIO', \
    'stringr', \
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
CMD ["start-server", "app/biomarkerTools.wsgi", \
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
     "--graceful-timeout", "300" \
     "--connect-timeout", "300" \
     "--log-directory", "logs", \
     "--rotate-logs", \
     "--access-log", \
     "--access-log-name", "biomarkerTools-access.log", \
     "--error-log-name", "biomarkerTools.log", \
     "--include-file", "/etc/httpd/conf.d/additional_configuration.conf"]
