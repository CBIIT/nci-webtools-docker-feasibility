FROM cbiitss/biomarker_tools:base

LABEL \
    BASE_IMAGE="cbiit/centos7:base" \
    DEFAULT_IMAGE="cbiitss/biomarker_tools" \
    DEFAULT_TAG="1.0.2" \
    DEFAULT_CONTAINER="biomarker_tools" \
    DESCRIPTION="Deployment environment for biomarker tools suite" \
    VERSION="1.0.2" \
    UID="BIOMARKER_TOOLS_1.0.2"

RUN yum install -y git \
 && yum clean all

ENV COMMON_REPOSITORY_URL="https://github.com/CBIIT/nci-analysis-tools-web-presence" \
    REPOSITORY_URL="https://github.com/CBIIT/nci-webtools-dceg-sw-computational-tools" \
    APP_RELEASE="Biomarker_1.0.2_20170728" \
    APP_DIRECTORY="biomarkerTools" \
    APP_NAME="biomarkerTools"

RUN git clone -b $APP_RELEASE $REPOSITORY_URL /tmp/repository \
 && git clone -b $APP_RELEASE $COMMON_REPOSITORY_URL /tmp/common-repository \
 && mkdir -p /deploy/app \
 && cp -r /tmp/repository/$APP_DIRECTORY/* /deploy/app \
 && cp -r /tmp/common-repository/common /deploy/app \
 && rm -rf /tmp/repository /tmp/common-repository \
 && chown -R apache:apache /deploy

CMD entrypoint.sh $APP_NAME
