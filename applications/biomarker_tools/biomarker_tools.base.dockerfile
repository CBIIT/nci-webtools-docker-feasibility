FROM cbiitss/r:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/biomarker_tools" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="biomarker_tools" \
    DESCRIPTION="Deployment environment for biomarker tools suite" \
    VERSION="1.0" \
    UID="BIOMARKER_TOOLS_BASE"

RUN yum -y install epel-release \
 && yum -y update \
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
    'pROC', \
    'RJSONIO', \
    'stringr', \
    'xlsx'))"

ENV APP_NAME="biomarkerTools" \
    _JAVA_OPTIONS="-Xss2560k -Xmx2g"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
