FROM cbiitss/r:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/jpsurv" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="jpsurv"
    DESCRIPTION="Deployment environment for JPSurv" \
    VERSION="1.0" \
    UID="JPSURV_BASE"

RUN yum -y install epel-release \
 && yum -y upgrade \
 && yum -y install \
    httpd-devel \
    readline-devel \
 && yum clean all

RUN RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    rpy2

RUN R -e "install.packages(c( \
  'https://nciws-d709-v.nci.nih.gov/cbiit-package/cbiit/packages/JPSurv_2.0.31.tar.gz', \
  'rjson'))"

ENV APP_NAME="jpsurv" \
    _JAVA_OPTIONS="-Xss2560k -Xmx2g"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
