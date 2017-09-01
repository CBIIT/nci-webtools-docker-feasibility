FROM cbiitss/ldlink:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/ldlink" \
    DEFAULT_TAG="latest" \
    DEFAULT_CONTAINER="ldlink"
    DESCRIPTION="Deployment environment for LDlink" \
    VERSION="LATEST" \
    UID="LDLINK_LATEST"

RUN yum install -y git \
 && yum clean all

ENV COMMON_REPOSITORY="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
    APP_REPOSITORY="https://github.com/CBIIT/nci-webtools-dceg-linkage" \
    APP_RELEASE="master" \
    APP_DIRECTORY="LDlink" \
    APP_NAME="LDlink"

RUN git clone -b $APP_RELEASE $APP_REPOSITORY /tmp/repository \
 && git clone -b $APP_RELEASE $COMMON_REPOSITORY /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/$APP_DIRECTORY/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "$APP_NAME"]