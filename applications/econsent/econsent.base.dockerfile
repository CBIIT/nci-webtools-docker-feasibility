FROM cbiitss/python:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/econsent" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="econsent"
    DESCRIPTION="Deployment environment for eConsent tool" \
    VERSION="1.0" \
    UID="ECONSENT_BASE"

RUN yum -y update \
 && yum -y install \
    gcc \
    httpd-devel \
    libffi-devel \
    libxml2-devel \
 && yum clean all

RUN pip install --upgrade \
    pip \
    setuptools \
 && pip install \
    flask \
    mod_wsgi \
    weasyprint

ENV APP_NAME="econsent"

COPY wsgi.conf /etc/httpd/conf.d/wsgi.conf

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh \
 && ln -s /usr/bin/entrypoint.sh /entrypoint.sh

RUN mkdir -p /deploy/app /deploy/logs

WORKDIR /deploy

CMD ["entrypoint.sh", "$APP_NAME"]
