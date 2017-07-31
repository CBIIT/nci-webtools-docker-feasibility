FROM cbiit/r_base:latest

LABEL \
  BASE_OS="CentOS 7" \
  DEFAULT_IMAGE="cbiit/biomarkertools" \
  DEFAULT_TAG="base" \
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
    pip \
    rpy2

RUN R -e "install.packages(c( \
    'pROC', \
    'RJSONIO', \
    'stringr', \
    'xlsx'))"

RUN export _JAVA_OPTIONS="-Xss2560k -Xmx2g"

COPY "./wsgi.conf" "/etc/httpd/conf.d/wsgi.conf"

COPY "./entrypoint.sh" "/usr/bin/entrypoint.sh"

RUN chmod 755 /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs 

WORKDIR /deploy

CMD ["entrypoint.sh", "biomarkerTools"]
