FROM cbiitss/jpsurv:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/jpsurv" \
    DEFAULT_TAG="latest" \
    DEFAULT_CONTAINER="jpsurv"
    DESCRIPTION="Deployment environment for JPSurv" \
    VERSION="LATEST" \
    UID="JPSURV_LATEST"

RUN yum install -y git \
 && yum clean all

ENV COMMON_REPOSITORY="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
    APP_REPOSITORY="https://github.com/CBIIT/nci-webtools-dccps-seer" \
    APP_RELEASE="master" \
    APP_DIRECTORY="jpsurv" \
    APP_NAME="jpsurv"

RUN git clone -b $APP_RELEASE $APP_REPOSITORY /tmp/repository \
 && git clone -b $APP_RELEASE $COMMON_REPOSITORY /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/$APP_DIRECTORY/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "$APP_NAME"]