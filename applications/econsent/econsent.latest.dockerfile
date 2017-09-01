FROM cbiitss/python:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/econsent" \
    DEFAULT_TAG="base" \
    DEFAULT_CONTAINER="econsent"
    DESCRIPTION="Deployment environment for eConsent tool" \
    VERSION="1.0" \
    UID="ECONSENT_BASE"

RUN yum install -y git \
 && yum clean all

ENV COMMON_REPOSITORY_URL="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
    REPOSITORY_URL="https://github.com/CBIIT/nci-webtools-cancer-terms-api" \
    APP_RELEASE="master" \
    APP_DIRECTORY="/" \
    APP_NAME="CancerTerms"

RUN git clone -b $APP_RELEASE $REPOSITORY_URL /tmp/repository \
 && git clone -b $APP_RELEASE $COMMON_REPOSITORY_URL /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/$APP_DIRECTORY/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "$APP_NAME"]