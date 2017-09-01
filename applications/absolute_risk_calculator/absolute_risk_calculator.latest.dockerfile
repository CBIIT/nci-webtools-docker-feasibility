FROM cbiitss/absolute_risk_calculator:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/absolute_risk_calculator" \
    DEFAULT_TAG="latest" \
    DEFAULT_CONTAINER="absolute_risk_calculator" \
    DESCRIPTION="Deployment environment for absolute risk calculator" \
    VERSION="LATEST" \
    UID="ABSOLUTE_RISK_CALCULATOR_LATEST"

RUN yum install -y git \
 && yum clean all

ENV COMMON_REPOSITORY_URL="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
    REPOSITORY_URL="https://github.com/CBIIT/nci-webtools-dceg-risk-assessment" \
    APP_RELEASE="master" \
    APP_DIRECTORY="absoluteRisk" \
    APP_NAME="absoluteRisk"

RUN git clone -b $APP_RELEASE $REPOSITORY_URL /tmp/repository \
 && git clone -b $APP_RELEASE $COMMON_REPOSITORY_URL /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/$APP_DIRECTORY/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD ["entrypoint.sh", "$APP_NAME"]