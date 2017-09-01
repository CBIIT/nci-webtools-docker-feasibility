FROM cbiitss/r:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/absolute_risk_calculator" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="absolute_risk_calculator" \
    DESCRIPTION="Deployment environment for absolute risk calculator" \
    VERSION="1.0" \
    UID="ABSOLUTE_RISK_CALCULATOR_BASE"

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
  'https://bioconductor.org/packages/release/bioc/src/contrib/iCARE_1.4.0.tar.gz', \
  'rjson'))"

ENV APP_NAME="absoluteRisk"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
