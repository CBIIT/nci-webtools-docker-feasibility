FROM cbiitss/python:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/cancer_terms_api" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="cancer_terms_api" \
    DESCRIPTION="Deployment environment for cancer terms api" \
    VERSION="1.0" \
    UID="CANCER_TERMS_API_BASE"

RUN yum -y update \
 && yum -y install \
    gcc \
    httpd-devel \
    openssl-devel \
 && yum clean all

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    pysqlcipher

ENV APP_NAME="CancerTerms"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
