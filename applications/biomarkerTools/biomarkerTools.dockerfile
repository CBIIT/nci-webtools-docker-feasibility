FROM cbiit/r_base:latest

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiit/biomarkertools" \
  DEFAULT_TAG="centos7" \
  DESCRIPTION="Deployment environment for Biomarker Tools Suite (based on CentOS 7)" \
  VERSION="1.0" \
  UID="BIOMARKERTOOLS_1.0_C7"

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
    pandas==0.15.2 \
    pip \
    rpy2

RUN R -e "install.packages(c( \
    'pROC', \
    'RJSONIO', \
    'stringr', \
    'xlsx'))"

RUN export _JAVA_OPTIONS="-Xss2560k -Xmx2g"

RUN echo -e '                                            \n\
<FilesMatch "\.(?i:conf|db|ini|py|pyc|wsgi|xml|r|md)$">  \n\
  Require all denied                                     \n\
</FilesMatch>                                            \n\
' >> /etc/httpd/conf.d/additional_configuration.conf

RUN mkdir -p /deploy/app /deploy/logs 
WORKDIR /deploy

COPY "./entrypoint.sh" "/usr/bin/entrypoint.sh"

RUN chmod 755 /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

CMD ["entrypoint.sh", "biomarkerTools"]
