FROM cbiitss/r_base

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

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask==0.12.2 \
    mod_wsgi==4.5.18 \
    rpy2==2.8.6

RUN R -e " \
    devtools::install_version('pROC',    version = '1.10.0' ); \
    devtools::install_version('RJSONIO', version = '1.3-0'  ); \
    devtools::install_version('stringr', version = '1.2.0'  ); \
    devtools::install_version('xlsx',    version = '0.5.7'  ); \
";

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

ENV APP_NAME="biomarkerTools" \
    _JAVA_OPTIONS="-Xss2560k -Xmx2g"

HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1

CMD entrypoint.sh $APP_NAME
